# README

The application was implemented using Ruby 2.7.1 and Rails 6.0.3.2.
The API was tested on Postman.

Make sure to run `rails db:migrate` and `rails db:seed`, as that will populate
the DB with the pokemons in the pokemons.csv file provided.

The expected parameter for the calls is the Pokemon database ID.

These are routes that have been implemented:
* GET /api/v1/pokemons
* GET /api/v1/pokemons/:id
* POST /api/v1/pokemons
* PATCH/PUT /api/v1/pokemons/:id
* DELETE /api/v1/pokemons/:id

If no `page` parameter is given in the `GET all pokemons` request, the response will not be paginated.
The pagination for the list of all Pokemon is set to a default limit of 100.
However, that can be changed by setting the query param `limit=#`.
* /api/v1/pokemons?page=1&limit=100
