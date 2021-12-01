abstract class CommandUseCase<C, R> {
  R call(C command);
}
