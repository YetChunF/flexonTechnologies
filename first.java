package presentation;

public class Car {
    // member variables (attributes)
    int modelYear;
    String modelName;

    // constructor
    public Car(int year, String name) {
        modelYear = year;
        modelName = name;
    }

    // member methods
    public void startEngine() {
        System.out.println("Engine started!");
    }

    public void stopEngine() {
        System.out.println("Engine stopped!");
    }

    public void getCarInfo() {
        System.out.println("Model Year: " + modelYear + " Model Name: " + modelName);
    }

    public static void main(String[] args) {
        Car myCar = new Car(2022, "Tesla Model 3");
        myCar.startEngine();
        myCar.stopEngine();
        myCar.getCarInfo();
    }
}

 public static void divide(int num1, int num2) throws ArithmeticException {
    if (num2 == 0) {
      throw new ArithmeticException("Cannot divide by zero");
    }
    int result = num1 / num2;
    System.out.println("Result: " + result);
  }

  public static void main(String[] args) {
    try {
      divide(10, 0);
    } catch (ArithmeticException ex) {
      System.out.println("Error: " + ex.getMessage());
    } finally {
      System.out.println("Program completed.");
    }
  }

class Car {
  private int speed;
  private String color;

  public Car(int speed, String color) {
    this.speed = speed;
    this.color = color;
  }

  public int getSpeed() {
    return speed;
  }

  public void setSpeed(int speed) {
    this.speed = speed;
  }

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public void display() {
    System.out.println("Car [Speed=" + speed + ", Color=" + color + "]");
  }
}

class SportsCar extends Car {
  private boolean turbo;

  public SportsCar(int speed, String color, boolean turbo) {
    super(speed, color);
    this.turbo = turbo;
  }

  public boolean isTurbo() {
    return turbo;
  }

  public void setTurbo(boolean turbo) {
    this.turbo = turbo;
  }

  @Override
  public void display() {
    System.out.println("SportsCar [Speed=" + getSpeed() + ", Color=" + getColor() + ", Turbo=" + turbo + "]");
  }
}

public class Main {
  public static void main(String[] args) {
    Car car = new Car(100, "Red");
    SportsCar sportsCar = new SportsCar(200, "Blue", true);
    Car sportsCarAsCar = new SportsCar(300, "Green", false);

    car.display();
    sportsCar.display();
    sportsCarAsCar.display();
  }


class Calculator {
  public int add(int a, int b) {
    return a + b;
  }

  public float add(float a, float b) {
    return a + b;
  }

  public double add(double a, double b) {
    return a + b;
  }
}

public class Main {
  public static void main(String[] args) {
    Calculator calculator = new Calculator();

    System.out.println("Sum of 2 and 3: " + calculator.add(2, 3));
    System.out.println("Sum of 2.5f and 3.5f: " + calculator.add(2.5f, 3.5f));
    System.out.println("Sum of 2.5 and 3.5: " + calculator.add(2.5, 3.5));
  }
}

class Car {
  private int speed;
  private String color;

  public int getSpeed() {
    return speed;
  }

  public void setSpeed(int speed) {
    this.speed = speed;
  }

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public void display() {
    System.out.println("Speed: " + speed + " Color: " + color);
  }
}

public class Main {
  public static void main(String[] args) {
    Car car = new Car();
    car.setSpeed(100);
    car.setColor("Red");
    car.display();
  }
}