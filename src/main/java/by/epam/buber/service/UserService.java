package by.epam.buber.service;

import by.epam.buber.entity.*;
import by.epam.buber.entity.participant.Driver;
import by.epam.buber.entity.participant.TaxiParticipant;
import by.epam.buber.entity.participant.User;
import by.epam.buber.repository.impl.OrderCrudRepositoryImpl;
import by.epam.buber.repository.impl.UserCrudRepositoryImpl;

import java.util.List;
import java.util.Random;

public class UserService {
    private UserCrudRepositoryImpl userCrudRepository = new UserCrudRepositoryImpl();
    private OrderCrudRepositoryImpl orderCrudRepository = new OrderCrudRepositoryImpl();


    public TaxiParticipant login(String name, String password){
        TaxiParticipant taxiParticipant = userCrudRepository.getByName(name);
        if(taxiParticipant != null){
            if(taxiParticipant.getPassword().equals(password)){
                return taxiParticipant;
            }
        }
        else{
            return null;
        }
        return null;
    }

    public TaxiParticipant signUp(String name, String password, String email, String phoneNumber){
        User user = (User) userCrudRepository.getByName(name);
        if(user == null){
            user = new User(name, password, email, phoneNumber);
            userCrudRepository.save(user);
        }
        return user;
    }

    public TaxiParticipant changeName(int id, String name) {
        TaxiParticipant taxiParticipant = userCrudRepository.getById(id);
        if (taxiParticipant != null) {
            taxiParticipant.setName(name);
            userCrudRepository.save(id, taxiParticipant);
            return taxiParticipant;
        }
        return null;
    }

    public TaxiParticipant changePassword(int id, String current, String newPassword, String repeatNewPassword) {
        TaxiParticipant taxiParticipant = userCrudRepository.getById(id);
        if (taxiParticipant != null) {
            if(taxiParticipant.getPassword().equals(current)){
                if(newPassword.equals(repeatNewPassword)) {
                    taxiParticipant.setPassword(newPassword);
                    userCrudRepository.save(id, taxiParticipant);
                    return taxiParticipant;
                }
            }
        }
        return null;
    }

    public Order makeOrder(int userId,String address, String carClass, String comment){
        Random random = new Random();
        int coordinates = random.nextInt(999000000 + 1);
        coordinates +=1000000;
        int destinationCoordinates = random.nextInt(999000000 + 1);
        destinationCoordinates +=1000000;
        Order order = new Order(userId, coordinates, address, comment,CarClass.valueOf(carClass.toUpperCase()),
                destinationCoordinates);
        orderCrudRepository.save(order);
        List<Driver> ableDrivers = userCrudRepository.getAllDrivers();
        order.setAbleDrivers(ableDrivers);
        return order;
    }

    public void sendDriverRequest(int driverId, int userId){
        Order order = orderCrudRepository.getByUserId(userId);
        userCrudRepository.setOrderToDriver(order, driverId);
    }

    public List<Driver>getDrivers(){
        return userCrudRepository.getAllDrivers();
    }
}
