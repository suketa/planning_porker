# use resource tokens

## config/routes.rb

```ruby
  resources :games, param: :token
```

## app/models/game.rb

add `to_param` public method returning token.

```ruby
class Game < ApplicationRecord

  def to_param
    token
  end

end
```

