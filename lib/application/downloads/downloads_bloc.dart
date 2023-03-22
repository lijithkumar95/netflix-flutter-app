import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/download.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDonloadsRepo _downloadsrepo;
  DownloadsBloc(this._downloadsrepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailorOrSuccessOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsOptions =
          await _downloadsrepo.getDownloadsImages();
      print(downloadsOptions);
      emit(
        downloadsOptions.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailorOrSuccessOption: Some(Left(failure)),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailorOrSuccessOption: Some(Right(success)),
          ),
        ),
      );
    });
  }
}
