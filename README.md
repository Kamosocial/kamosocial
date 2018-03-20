# Kamo.social

## Presentation

[Kamo.social](https://www.kamo.social/) is a website which allows you to meet other people based on their interests.

## Contribute

You want to give a hand? Thank you very much!

:warning: If you see this repository on Gitlab, the original is hosted on github.com. It is only mirrored on Gitlab. If you want to contribute, please check [here](https://github.com/Kamosocial/kamosocial)

## Installation

### Requirements:

- Ruby >=2.4.0
- Bundler >=1.1.4.2
- Yarn >=1.5.1

### Setup instructions

1. Clone the repository to your computer
2. Run `bundle install --without production`
3. Run `yarn install`
4. Run the migrations `bin/rails db:migrate`
5. Create a `.env` file and fill-in the following fields with your email parameters (it will allow you to send real emails in local):

```
export MAILER_DOMAIN=
export MAILER_ADDRESS=
export MAILER_USERNAME=
export MAILER_PASSWORD=
```

You can put anything in `MAILER_DOMAIN`, it should be the website domain.
For example, if you use Gmail, you could put these informations.

```
export MAILER_DOMAIN=development.kamo.social
export MAILER_ADDRESS=smtp.gmail.com
export MAILER_USERNAME=john.doe@gmail.com
export MAILER_PASSWORD=JohnDo3sP4ssword
```

If you don't want to send real emails while in development environment, go to `config/environments/development.rb` and:
 - Update this line: `config.action_mailer.raise_delivery_errors = false`
 - Delete these lines:
 ```
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: ENV["MAILER_ADDRESS"],
    port: 587,
    domain: ENV["MAILER_DOMAIN"],
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["MAILER_USERNAME"],
    password: ENV["MAILER_PASSWORD"]
  }

 ```

6. Run the server `make serve` (it does `source .env && bin/rails server` under the hood)

You now have the website up and running in local!

## Developer Guide

### Map

As every display of the map adds onto a quota and costs money, the map is disabled by default in development mode.

If you need to work on the map, you need to add the following environment variable before launching the server: `DEV_FORCE_DISPLAY_MAP=enabled`.

If you switch the variable, you need to restart the server and edit the `map.js.erb` file in order for the modification to be taken into account.

## License

Source code is licensed under the French [CeCILL](LICENSE.md) Free Software License.

However the Kamo.social brand and its graphical assets are proprietary.
