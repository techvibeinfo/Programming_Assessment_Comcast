namespace :apple do

  # rake apple:add_apple_to_basket["Red Apple",5]

  desc 'Task 2'
  task :add_apple_to_basket, [:variety, :count] => :environment do |t, args|
    puts "Adding Apple to Basket...................!!!"
    p args[:variety]
      all_basket= Basket.all.ids
      basket_with_apple = Apple.where(variety: args[:variety]).group(:basket_id).count
      p basket_with_apple
      basket_with_apple.each do |key ,value|
        if value < 2
          basket_with_apple.delete(key)
        end
      end
      free_basket = all_basket - basket_with_apple.keys
      p free_basket
      count = args[:count].to_i 
      bsk = Apple.all.group(:basket_id).count

  end

end
