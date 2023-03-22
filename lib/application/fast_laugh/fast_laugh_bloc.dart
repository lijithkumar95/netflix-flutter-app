import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/download.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@Injectable()
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDonloadsRepo _downloadService)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      // sending loading to ui
      emit(const FastLaughState(
        videoList: [],
        isLoading: true,
        isError: false,
      ));
      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold((l) {
        return const FastLaughState(
          videoList: [],
          isLoading: false,
          isError: true,
        );
      }, (res) {
        return FastLaughState(
          videoList: res,
          isLoading: false,
          isError: false,
        );
      });
      // sent to ui
      emit(_state);
    });

    on<LikeVideos>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
    on<UnLikeVideos>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
  }
}
