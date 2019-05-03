import 'package:flutterigapi/models/mediaModel.dart';
import 'package:flutterigapi/models/profileModel.dart';
import 'package:flutterigapi/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

final bloc = Bloc();

class Bloc {
  final _repository = Repository();
  final _profilFetcher = PublishSubject<Profile>();
  final _mediaFetcher = PublishSubject<Media>();

  Observable<Profile> get allProfil => _profilFetcher.stream;
  Observable<Media> get allMedia => _mediaFetcher.stream;

  fetchAllProfile() async {
    Profile profile = await _repository.fetchAllProfile2();
    _profilFetcher.sink.add(profile);
  }

  fetchAllMedia() async {
    Media media = await _repository.fetchAllMedia2();
    _mediaFetcher.sink.add(media);
  }

  dispose() {
    _profilFetcher.close();
    _mediaFetcher.close();
  }
}
