## Database

The app uses PostGreSQL. To set up database, use `rails db:setup` and then `rails db:migrate`.

## Model and Controller

Within the `Recipe` model, the `search` scope is set using `ILIKE` to filter results in a case-insensitive manner. This is called from the `index` action of the `RecipesController`.

## Rake Task

The following rake take will be used for importing API data.

`rake import:recipes`

The tasks will use existing Ruby libraries such as `'open-uri`, `'net/http'`and `'json'` to make connections to the API endpoints and then collect and parse the data. This parsed data is used to create new Recipe records after validating uniqueness of the `href` value. This way, no record is duplicated within the system.

## Gems used

External gems used in this app include `pg` for using PostgreSQL, `jquery-rails` and `bootstrap-sass` for styling, `slim-rails` for markup and `kaminari` for pagination.

## Javascript

Basic jquery is used with the existing `keyup` function to conduct live search results. This is a slightly improvised version from [Ryan Bates' screencast](https://www.youtube.com/watch?v=_hMp2SAsWXw).
