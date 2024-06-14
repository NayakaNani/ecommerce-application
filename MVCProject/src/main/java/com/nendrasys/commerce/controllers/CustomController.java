package com.nendrasys.commerce.controllers;

import com.nendrasys.commerce.model.*;
import org.springframework.http.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.*;

@Controller
public class CustomController {

    private RestTemplate restTemplate;

    @RequestMapping(value = "/getAllUsers",method = RequestMethod.GET)
    public String getAllUsers(Model model){
        ResponseEntity<User[]> responseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getAllUsers", User[].class);
        User[] users = responseBody.getBody();
        List<User> list = Arrays.asList(users);
        model.addAttribute("data",list);
        return "display";
    }

    @RequestMapping(value = "/getParticularUserStarter",method = RequestMethod.GET)
    public String getParticularUserStarter(){
        return "getUser";
    }

    @RequestMapping(value = "/getParticularUser",method = RequestMethod.GET)
    public String getParticularUser(@RequestParam("id") int id, Model model){
        ResponseEntity<User> responseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getParticularUser?id={id}", User.class,id);
        List<User> list = new ArrayList<>();
        list.add(responseBody.getBody());
        model.addAttribute("data",list);
        return "display";
    }

    @RequestMapping("/userStarter")
    public String getUserStarter(Model model,@RequestParam(required = false) String samePage){
        User user = new User();
        model.addAttribute("user",user);
        if(samePage!=null && !samePage.isEmpty()){
            model.addAttribute("samePage",samePage);
        }
        return "addUser";
    }

    @RequestMapping("/addUser")
    public String addUser(@ModelAttribute("user") User user,@RequestParam(required = false) String samePage,Model model){
        user.setRole("ROLE_USER");
        user.setEnabled(1);
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        HttpEntity<User> request = new HttpEntity<>(user,headers);
        ResponseEntity<Boolean> responseEntity = restTemplate.exchange("http://localhost:8081/Ecommerce_Project_war_exploded/addUser", HttpMethod.POST,request,Boolean.class);
        Boolean result = responseEntity.getBody();
        if(samePage!=null && !samePage.isEmpty()){
            return getAllUsers(model);
        }else{
            model.addAttribute("type","Created");
            model.addAttribute("flag",result);
            return "result";
        }
    }


    @RequestMapping(value = "/updateUserStarterOne",method = RequestMethod.GET)
    public String updateUserStarterOne(){
        return "updateUserStarter";
    }

    @RequestMapping(value = "/updateUserStarter",method = RequestMethod.GET)
    public String updateUserStarter(@RequestParam("id") int id,@RequestParam(required = false) String samePage, Model model){
        ResponseEntity<User> responseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getParticularUser?id={id}", User.class,id);
        User user = responseBody.getBody();
        model.addAttribute("lastPassword",user.getPassword());
        user.setPassword("");
        model.addAttribute("command",user);
        if(samePage!=null && !samePage.isEmpty()){
            model.addAttribute("samePage",samePage);
        }
        return "updateUser";
    }

    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public String updateUser(@Valid @ModelAttribute("command") User user, @RequestParam(required = false) String samePage, Model model, HttpServletRequest httpServletRequest) {
        HttpSession session = httpServletRequest.getSession();
        user.setRecentPurchase((Timestamp) session.getAttribute("recentPurchase"));
        user.setHighestPurchase((int)session.getAttribute("highestPurchase"));
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        HttpEntity<User> request = new HttpEntity<>(user, headers);
        ResponseEntity<Boolean> responseEntity = restTemplate.exchange("http://localhost:8081/Ecommerce_Project_war_exploded/updateUser", HttpMethod.POST, request, Boolean.class);
        Boolean result = responseEntity.getBody();
        if(samePage!=null && !samePage.isEmpty()){
            return getAllUsers(model);
        }else{
            session = httpServletRequest.getSession();
            String role = (String) session.getAttribute("role");
            model.addAttribute("role",role);
            model.addAttribute("type","Updated");
            model.addAttribute("flag",result);
            return "result";
        }
    }


    @RequestMapping(value = "/deleteUserStarter",method = RequestMethod.GET)
    public String deleteUserStarter(){
        return "deleteUser";
    }

    @RequestMapping(value = "/deleteUser",method = RequestMethod.GET)
    public String deleteUser(@RequestParam("id") int id,@RequestParam(required = false) String samePage,Model model){
        ResponseEntity<Boolean> orderResponseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/deleteOrders?id={id}",Boolean.class,id);
        Boolean orderResult = orderResponseBody.getBody();
        ResponseEntity<Boolean> cartResponseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/deleteUserCartProducts?userId={userId}",Boolean.class,id);
        Boolean cartResult = cartResponseBody.getBody();
        ResponseEntity<Boolean> responseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/deleteUser?id={id}", Boolean.class,id);
        Boolean result = responseBody.getBody();
        Boolean deleted = (cartResult && result);
        if(samePage!=null && !samePage.isEmpty()){
            return getAllUsers(model);
        }else{
            model.addAttribute("type","Deleted");
            model.addAttribute("flag",deleted);
            return "result";
        }
    }

    @RequestMapping("/")
    public String getProducts(HttpServletRequest httpServletRequest, Model model, Authentication authentication){
        if(authentication != null && authentication.isAuthenticated()){
            ResponseEntity<User> userResponseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getUserByName?un={name}", User.class,authentication.getName());
            User user = userResponseEntity.getBody();
            HttpSession session = httpServletRequest.getSession();
            session.setAttribute("userId",user.getId());
            session.setAttribute("recentPurchase",user.getRecentPurchase());
            session.setAttribute("highestPurchase",user.getHighestPurchase());
            for(GrantedAuthority authority : authentication.getAuthorities()){
                if(authority.getAuthority().equals("ROLE_ADMIN")){
                    session.setAttribute("role","admin");
                }else{
                    session.setAttribute("role","user");
                }
            }
            session.setAttribute("in",true);
        }
        httpServletRequest.getSession().setAttribute("lastSuccessfulUrl","");
        ResponseEntity<Product[]> responseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getProducts", Product[].class);
        Product[] products = responseEntity.getBody();
        List<Product> list = Arrays.asList(products);
        Collections.shuffle(list);
        model.addAttribute("products", list);
        return "CommerceHomePage";
    }

    @RequestMapping("/home")
    public String home(){
        return "home";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/signout")
    public String signout(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
        return "redirect:/";
    }

    @RequestMapping("/userStatus")
    public String userStatus(@RequestParam Integer id,@RequestParam String status){
        if(status.equals("on")){
            ResponseEntity<Boolean> responseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/enableUser?id={id}", Boolean.class,id);
            Boolean result = responseBody.getBody();
        }else{
            ResponseEntity<Boolean> responseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/disableUser?id={id}", Boolean.class,id);
            Boolean result = responseBody.getBody();
        }
        return "redirect:/getAllUsers";
    }

    @RequestMapping("/userProfile")
    public String userProfile(Model model,HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        int userId = (int)session.getAttribute("userId");
        ResponseEntity<User> responseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getParticularUser?id={id}", User.class,userId);
        User user = responseBody.getBody();
        user.setPassword("");
        model.addAttribute("command",user);
        model.addAttribute("fromUserProfile",true);
        return "updateUser";
    }

    @RequestMapping(value = "/pdp",method = RequestMethod.GET)
    public String pdp(@RequestParam("id") int id,Model model){
        ResponseEntity<Product> responseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getProductById?id={id}", Product.class,id);
        Product product = responseEntity.getBody();
        model.addAttribute("product",product);
        return "productDetailsPage";
    }

    @RequestMapping(value = "/addToCart",method = RequestMethod.GET)
    public String addToCart(@RequestParam Integer productId,HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        Integer userId = (Integer)session.getAttribute("userId");
        ResponseEntity<Boolean> responseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/addCartProduct?productId={productId}&userId={userId}", Boolean.class,productId,userId);
        Boolean result = responseEntity.getBody();
        return "redirect:/getCartProducts";
    }

    @RequestMapping("/getCartProducts")
    public String getCartProducts(Model model,HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        Integer id = (Integer)session.getAttribute("userId");
        ResponseEntity<CartProduct[]> userResponseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getCartProducts?id={id}", CartProduct[].class,id);
        CartProduct[] cartProducts = userResponseEntity.getBody();
        List<Product> products = new ArrayList<>();
        ResponseEntity<Product[]> responseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getProducts", Product[].class);
        Product[] allProducts = responseEntity.getBody();
        int total = 0;
        for(CartProduct cartProduct: cartProducts){
            for(Product product: allProducts){
                if(product.getId().equals(cartProduct.getProductId())){
                    products.add(product);
                    total+=product.getPrice();
                }
            }
        }
        session.setAttribute("total",total);
        Collections.reverse(products);
        model.addAttribute("cartProducts",products);
        model.addAttribute("total",total);
        return "cartProducts";
    }

    @RequestMapping("/removeCartProduct")
    public String removeCartProduct(@RequestParam Integer productId,HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        Integer userId = (Integer)session.getAttribute("userId");
        ResponseEntity<Boolean> responseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/deleteCartProduct?productId={productId}&userId={userId}", Boolean.class,productId,userId);
        Boolean result = responseEntity.getBody();
        return "redirect:/getCartProducts";
    }

    @RequestMapping("/deleteUserCart")
    public String deleteUserCart(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        Integer userId = (Integer)session.getAttribute("userId");
        ResponseEntity<Boolean> cartResponseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/deleteUserCartProducts?userId={userId}",Boolean.class,userId);
        Boolean cartResult = cartResponseBody.getBody();
        return "redirect:/getCartProducts";
    }

    @RequestMapping("/placeOrder")
    public String placeOrder(@RequestParam int id,@RequestParam int amount,HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        int userId = (int)session.getAttribute("userId");

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Content-Type", "application/json");
        User user = new User();
        user.setId(userId);
        int highestPurchase = (int)session.getAttribute("highestPurchase");
        if(highestPurchase<amount){
            user.setHighestPurchase(amount);
        }else{
            user.setHighestPurchase(highestPurchase);
        }
        user.setRecentPurchase(new Timestamp(new Date().getTime()));
        HttpEntity<User> httpEntity = new HttpEntity<>(user,httpHeaders);
        ResponseEntity<Boolean> purchaseResult = restTemplate.exchange("http://localhost:8081/Ecommerce_Project_war_exploded/updatePurchase", HttpMethod.POST, httpEntity, Boolean.class);
        Boolean purchaseResultBody = purchaseResult.getBody();

        OrdersModel ordersModel = new OrdersModel();
        ordersModel.setOrderDate(new Timestamp(new Date().getTime()));
        ordersModel.setProductId(id);
        int orderId = new Random().nextInt(10000);
        ordersModel.setOrderId(orderId);
        session.setAttribute("orderId",orderId);
        ordersModel.setUserId(userId);
        HttpHeaders header = new HttpHeaders();
        header.set("Content-Type", "application/json");
        HttpEntity<OrdersModel> request = new HttpEntity<>(ordersModel, header);
        ResponseEntity<Boolean> responseEntity = restTemplate.exchange("http://localhost:8081/Ecommerce_Project_war_exploded/addOrder", HttpMethod.POST, request, Boolean.class);
        Boolean result = responseEntity.getBody();
        return "redirect:/metaDetails";
    }

    @RequestMapping("/placeOrders")
    public String placeOrders(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        int userId = (int)session.getAttribute("userId");
        int total = (int)session.getAttribute("total");

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Content-Type", "application/json");
        User user = new User();
        user.setId(userId);
        int highestPurchase = (int)session.getAttribute("highestPurchase");
        if(highestPurchase<total){
            user.setHighestPurchase(total);
        }else{
            user.setHighestPurchase(highestPurchase);
        }
        user.setRecentPurchase(new Timestamp(new Date().getTime()));
        HttpEntity<User> httpEntity = new HttpEntity<>(user,httpHeaders);
        ResponseEntity<Boolean> purchaseResult = restTemplate.exchange("http://localhost:8081/Ecommerce_Project_war_exploded/updatePurchase", HttpMethod.POST, httpEntity, Boolean.class);
        Boolean purchaseResultBody = purchaseResult.getBody();

        List<OrdersModel> ordersModels = new ArrayList<>();
        ResponseEntity<CartProduct[]> userResponseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getCartProducts?id={id}", CartProduct[].class,userId);
        CartProduct[] cartProducts = userResponseEntity.getBody();

        int orderId = new Random().nextInt(1000000);
        session.setAttribute("orderId",orderId);
        Timestamp timestamp = new Timestamp(new Date().getTime());
        for(CartProduct cartProduct: cartProducts){
                ordersModels.add(new OrdersModel(timestamp,cartProduct.getProductId(),orderId,userId));
        }
        OrdersModel[] ordersModelArray = ordersModels.toArray(new OrdersModel[ordersModels.size()]);
        HttpHeaders header = new HttpHeaders();
        header.set("Content-Type", "application/json");
        HttpEntity<OrdersModel[]> request = new HttpEntity<>(ordersModelArray, header);
        ResponseEntity<Boolean> responseEntity = restTemplate.exchange("http://localhost:8081/Ecommerce_Project_war_exploded/addOrders", HttpMethod.POST, request, Boolean.class);
        Boolean result = responseEntity.getBody();
        ResponseEntity<Boolean> cartResponseBody = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/deleteUserCartProducts?userId={userId}",Boolean.class,userId);
        Boolean cartResult = cartResponseBody.getBody();
        return "redirect:/metaDetails";
    }

    @RequestMapping("/getOrders")
    public String getOrders(HttpServletRequest httpServletRequest,Model model){
        HttpSession session = httpServletRequest.getSession();
        int userId = (int)session.getAttribute("userId");
        OrderDisplayModel[] ordersModels = restTemplate.getForObject("http://localhost:8081/Ecommerce_Project_war_exploded/getUserOrders?id={id}", OrderDisplayModel[].class,userId);
        ResponseEntity<Product[]> responseEntity = restTemplate.getForEntity("http://localhost:8081/Ecommerce_Project_war_exploded/getProducts", Product[].class);
        Product[] allProducts = responseEntity.getBody();
        List<OrderDispalyProductModel> list = new ArrayList<>();
        int i =0;
        for(OrderDisplayModel orderDisplayModel: ordersModels){
            list.add(new OrderDispalyProductModel(orderDisplayModel.getOrderDate(),orderDisplayModel.getOrderID(),new ArrayList<>()));
            for(OrdersModel ordersModel : orderDisplayModel.getOrdersModels()){
                for(Product product: allProducts){
                    if(ordersModel.getProductId().equals(product.getId())){
                        list.get(i).getProductList().add(product);
                    }
                }
            }
            i++;
        }
        Collections.reverse(list);
        model.addAttribute("orders",list);
        return "orders";
    }

    @RequestMapping("/metaDetails")
    public String metaDetails(){
        return "metaOrderDetails";
    }

    @RequestMapping("/orderResult")
    public String orderResult(Authentication authentication,HttpServletRequest httpServletRequest,Model model){
        HttpSession session = httpServletRequest.getSession();
        int orderId = (int)session.getAttribute("orderId");
        String name = authentication.getName();
        model.addAttribute("orderId",orderId);
        model.addAttribute("username",name);
        return "orderResult";
    }

    public void setRestTemplate(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

}
