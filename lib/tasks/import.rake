namespace :import do

  desc "Extact recipes from Recipe Puppy"
  task recipes: :environment do

    uri = URI.parse("http://www.recipepuppy.com/api/")

    http = Net::HTTP.new(uri.host, uri.port)    
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    if response.code == "200"
      results = JSON.parse(response.body)

      all_recipes = Recipe.all

      results["results"].each do |result|
        unless all_recipes.map(&:href).include?(result["href"])
          Recipe.create!(
            title: result["title"],
            href: result["href"],
            ingredients: result["ingredients"],
            thumbnail: result["thumbnail"]
          )
          puts "\e[32m[Imported]\e[0m Recipe '#{result["title"]}' created successfully."
        end
      end
    else
      puts "\e[31m[Error]\e[0m URL was not found. No data could be imported."
    end
  end
end