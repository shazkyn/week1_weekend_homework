def pet_shop_name(shop_name)
  return shop_name[:name]
end

def total_cash(sum)
  return sum[:admin][:total_cash]
end

def add_or_remove_cash__add(shop, value)
  return shop[:admin][:total_cash] +=  value
end

def add_or_remove_cash(shop, value)
  return shop[:admin][:total_cash] +=  value
end

def pets_sold(sold)
  return sold[:admin][:pets_sold]
end

def increase_pets_sold(shop, value)
  return shop[:admin][:pets_sold] += value
end

def stock_count(shop)
  return shop[:pets].count
end

def pets_by_breed(shop, breed)
  return shop[:pets].select { |pet| pet[:breed] == breed }
end

def find_pet_by_name(shop, pet_name)
  return shop[:pets].select { |pet| pet[:name] == pet_name }[0]
end

def remove_pet_by_name(shop, pet_name)
  shop[:pets].delete (find_pet_by_name(shop, pet_name))
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets].push << new_pet
  return shop[:pets].count
end

def customer_cash(person)
  return person[:cash]
end

def remove_customer_cash(person, amount)
  return person[:cash] -=  amount
end

def customer_pet_count(person)
  return person[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push << new_pet
  return customer[:pets].count
end

#optionals
def customer_can_afford_pet(customer, pet)
  return customer_cash(customer) > pet[:price]
end


def sell_pet_to_customer(shop, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      remove_pet_by_name(shop, pet[:name])
      remove_customer_cash(customer, pet[:price])
      increase_pets_sold(shop, 1)
      add_or_remove_cash(shop, pet[:price])
    end
  end
end
