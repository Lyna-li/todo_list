class Car {
  String model;
  bool isAvailable;
  Car(this.model) : isAvailable = true;

void rentCar() {
    if (isAvailable) {
      isAvailable = false;
      print('$model has been rented out');
    } else {
      print('$model is already rented out');
    }
  }

void returnCar() {
    if (!isAvailable) {
      isAvailable = true;
      print('$model has been returned.');
    } else {
      print('$model is already in the inventory');
    }
  }
}

class RentalSystem{
  List<Car> cars = [];

void AddCar(String model)
  {
    cars.add(Car(model));
    print('added a new car $model to the inventory');
  }
void rentCar(String model) {
    Car car;
    bool found = false;
    for (car in cars) {
      if (car.model == model && car.isAvailable) {
        car.rentCar();
        found = true;
        break;
      }
    }
    if (!found) {
      print("The model $model is not available");
    }
  }

void returnCar(String model) {
    Car car;
    bool found = false;
    for (car in cars) {
      if (car.model == model && !car.isAvailable) {
        car.returnCar();
        found = true;
        break;
      }
    }
    if (!found) {
      print("The model $model is not rented out or does not exist");
    }
  }

void displayCars(){

  for(var car in cars){
    if(car.isAvailable == true){
       print(' the model ${car.model} is avaible');
    }
    else {
       print(' the model ${car.model} is unavaible');
    }
   
  }
}
}

void main(){

  var rentalSystem = RentalSystem();

  rentalSystem.AddCar('BMW');
  rentalSystem.AddCar('Mercedes');

  rentalSystem.rentCar('BMW');
  rentalSystem.returnCar('BMW');
  rentalSystem.returnCar('Mercedes');
  rentalSystem.displayCars();


}