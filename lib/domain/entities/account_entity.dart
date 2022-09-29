import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AccountEntity extends Equatable{
final String token;
final String name;
final String email;

  AccountEntity({@required this.token,@required this.name,@required this.email});
  
  @override
  List<Object> get props => [token,name,email];

}