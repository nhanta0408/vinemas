import '../../../seat_selection/domain/entities/ticket_entity.dart';
import '../../../seat_selection/domain/repository/seat_selection_repository.dart';
import '../repo/account_repository.dart';
import 'account_usecase.dart';

class AccountUsecaseImplement extends AccountUsecase {
  final AccountRepository _repository;
  AccountUsecaseImplement(this._repository);
}
