# Projeto Foundbooy
Projeto básico de CRUD de autores e livros, onde somente é permitido a adição/edição e remoção de informações
através de login.
## Linguagens usadas
* Ruby 2.6.6
* Rails 6.1.1
## Arquitetura
* MVC (Utilizando views, controllers e models)
* Uma única base
* Testes unitários
## Serviços necessários
* Ruby instalado (Foi utilizado método rvm)
* Gem rails instalado
* MySQL (local)

## Como iniciar
* Mysql com a usuario root e senha 1234 (Ou modifique o arquivo database.yml com usuario/senha que deseja)
* Rode `rake db:create`, `rake db:migrate`, `rake db:seeds` para iniciar uma base de dados inicial
e para geração de um login de administrador.(Login: `admin@admin.com` Senha: `admin123`)