package com.nendrasys.customApi;


import com.nendrasys.model.OrderDisplayModel;
import com.nendrasys.model.OrdersModel;
import com.nendrasys.service.OrdersService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class OrdersController {

    private OrdersService ordersService;

    @RequestMapping(value = "/addOrder",method = RequestMethod.POST)
    public Boolean addOrder(@RequestBody OrdersModel ordersModel) {
        Boolean result = ordersService.addOrder(ordersModel);
        return result;
    }

    @RequestMapping(value = "/addOrders" ,method = RequestMethod.POST)
    public Boolean addOrders(@RequestBody OrdersModel[] ordersModels){
        Boolean result = ordersService.addOrders(ordersModels);
        return result;
    }

    @RequestMapping(value = "/getOrders" ,method = RequestMethod.GET,produces ="application/json")
    public OrdersModel[] getOrders(@RequestParam int id){
        OrdersModel[] ordersModels = ordersService.getOrders(id);
        return ordersModels;
    }

    @RequestMapping(value = "/getUserOrders",method = RequestMethod.GET,produces = "application/json")
    public OrderDisplayModel[] getOrdersDisplay(@RequestParam int id){
        OrdersModel[] ordersModels = ordersService.getOrders(id);
        Map<Integer,OrderDisplayModel> mapDisplayModel = new HashMap<>();
        List<Integer> ids = new ArrayList<>();
        for(OrdersModel ordersModel : ordersModels){
            if(!ids.contains(ordersModel.getOrderId())){
                ids.add(ordersModel.getOrderId());
                mapDisplayModel.put(ordersModel.getOrderId(),new OrderDisplayModel(ordersModel.getOrderDate(),ordersModel.getOrderId(),new ArrayList<OrdersModel>()));
                mapDisplayModel.get(ordersModel.getOrderId()).getOrdersModels().add(ordersModel);
                System.out.println(ordersModel.getOrderId());
            }else{
                mapDisplayModel.get(ordersModel.getOrderId()).getOrdersModels().add(ordersModel);
                System.out.println("Yes"+ordersModel.getOrderId());
            }
        }
        List<OrderDisplayModel> list = new ArrayList<>();
        for(int i: ids){
            list.add(mapDisplayModel.get(i));
        }
        OrderDisplayModel[] ordersDisplayModels =list.toArray(new OrderDisplayModel[list.size()]);
        return ordersDisplayModels;
    }

    @RequestMapping("/deleteOrders")
    public Boolean deleteOrders(@RequestParam int id){
        Boolean result = ordersService.deleteOrders(id);
        return result;
    }

    public void setOrdersService(OrdersService ordersDao) {
        this.ordersService = ordersDao;
    }
}
