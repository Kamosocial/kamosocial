# Kamo.social

## Presentation

[Kamo.social](https://www.kamo.social/) is a website which allows you to meet other people based on their interests.

## Contribute

You want to give a hand? Thank you very much!

:warning: This repository is hosted on github.com. It is only mirrored on Gitlab. If you want to contribute, please check [here](https://github.com/KillianKemps/kamosocial)

## Installation

### Requirements:

- Ruby >=2.4.0
- Bundler >=1.1.4.2

### Setup instructions

1. Clone the repository to your computer
2. Run `bundle install`
3. Run the migrations `bin/rails db:migrate`
4. Create a `.env` file and fill-in the following fields with your email parameters (it will allow you to send real emails in local):

```
export EMAIL_DOMAIN=
export EMAIL_USERNAME=
export EMAIL_PASSWORD=
```

5. Run the server `source .env && bin/rails server`

You now have the website up and running in local!

## License

Source code is licensed under the French [CeCILL](LICENSE.md) Free Software License.

However the Kamo.social brand and its graphical assets are proprietary.
