# Push::Notification::Firebase

Esta gem foi especialmente projetada para simplificar a vida dos desenvolvedores que desejam integrar as funcionalidades de Push Notification do Firebase em seus aplicativos. Através de uma interface
amigável e uma documentação detalhada, a ferramenta promete eliminar a complexidade inerente ao processo de configuração e envio de notificações. Ela serve como uma ponte eficaz entre o seu código e o
Firebase, garantindo que as mensagens sejam enviadas de maneira eficiente e sem erros. A otimização do tempo e a eficácia da comunicação são dois dos principais benefícios dessa gem, tornando-a um
recurso indispensável para quem busca excelência em desenvolvimento.

## Instalacao

Adicione esta linha ao Gemfile do seu aplicativo:

```ruby
gem 'push-notification-firebase'
```

Depois execute:

    $ bundle install

Ou instale:

    $ gem install push-notification-firebase

## Exxemplo

```ruby
require 'push/notification/firebase'
include Push::Notification::Firebase

# ... 
logger = Logger.new("development.log")
hash = {
  "title": "Titulo",
  "token": "TOKEN-DO-DISPOSITIVO",
  "message": "Mensagem para o usuário",
}
Push::Notification::Firebase::processing hash, logger
# ...  
```

## Desenvolvimento

Após clonar o repositório, execute `bin/setup` para instalar as dependências. Você também pode executar `bin/console` para um prompt interativo que permitirá que você experimente.

Para instalar esta gem na sua máquina local, execute `bundle exec rake install`. Para lançar uma nova versão, atualize o número da versão em `version.rb` e, em seguida,
execute `bundle exec rake release`, o que criará uma tag git para a versão, enviará os commits e tags git, e enviará o arquivo `.gem` para [rubygems.org](https://rubygems.org).

## Build
```shell
gem build push-notification-firebase.gemspec
```

Precisa mmudar a versão no arquivo `version.rb`

```shell
gem push push-notification-firebase-1.0.0.gem
```

## Contribuindo

Relatórios de bugs e solicitações de pull são bem-vindos no GitHub em https://github.com/armando-couto/push-notification-firebase. Este projeto tem a intenção de ser um espaço seguro e acolhedor para
colaboração, e espera-se que os colaboradores adiram ao [code of conduct](https://github.com/armando-couto/push-notification-firebase/blob/master/CODE_OF_CONDUCT.md).

## Licença

A gem está disponível como código aberto sob os termos da [MIT License](https://opensource.org/licenses/MIT).

## Código de Conduta

Todos que interagem nas bases de código, rastreadores de problemas, salas de chat e listas de e-mails do projeto Push::Notification::Firebase são esperados a seguir
o [código de conduta](https://github.com/armando-couto/push-notification-firebase/blob/main/CODE_OF_CONDUCT.md).
