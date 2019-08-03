def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, new_cash)
  pet_shop_hash[:admin][:total_cash] += new_cash
end

def pets_sold(pet_shop_hash)
  pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_hash, new_cash)
  pet_shop_hash[:admin][:pets_sold] += new_cash
end

def stock_count(pet_shop_hash)
  pet_shop_hash[:pets].count
end

def pets_by_breed(pet_shop_hash, breed_to_find)
  pet_list = []
  for pet in pet_shop_hash[:pets]
    if pet[:breed] == breed_to_find
       pet_list.push(pet)
    end
  end
  return pet_list
end

def find_pet_by_name(pet_shop_hash, pet_to_find)
pet_by_name = {}
  for pet in pet_shop_hash[:pets]
    if pet[:name] == pet_to_find
      pet_by_name = pet
    end
  end
  if pet_by_name.empty?
    return nil
  else
    return pet_by_name
  end
end

# We have to return nil, so, if the hash is empty return nil. We don't want to return a empty hash. error was showing the result "expected {} to be nil"

def remove_pet_by_name(pet_shop_hash, pet_to_remove)
  for pet in pet_shop_hash[:pets]
    if pet[:name] == pet_to_remove
      pet_shop_hash[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop_hash, pet_to_add)
  pet_shop_hash[:pets].push(pet_to_add)
end

def customer_cash(customers_array)
  customers_array[:cash]
end

def remove_customer_cash(customers_array, cash_to_remove)
  customers_array[:cash] -= cash_to_remove
end

def customer_pet_count(customers_array)
  customers_array[:pets].count
end

def add_pet_to_customer(customers_array, pet_to_add)
customers_array[:pets].push(pet_to_add)
p customers_array[:pets].count
end

def customer_can_afford_pet(customers_array, pet_to_buy)
  if customers_array[:cash] >= pet_to_buy[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop_hash, pet_to_sell, customer_hash)
  if pet_to_sell == nil
    return
  elsif customer_hash[:cash] < pet_to_sell[:price]
    return
  else
    pet_price = pet_to_sell[:price]

    customer_hash[:pets].push(pet_to_sell)
    pet_shop_hash[:admin][:pets_sold] += 1
    customer_hash[:cash] -= pet_price
    pet_shop_hash[:admin][:total_cash] += pet_price
  end
end
