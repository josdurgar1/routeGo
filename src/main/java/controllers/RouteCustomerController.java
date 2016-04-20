package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Activity;
import domain.Category;
import domain.Company;
import domain.Customer;
import domain.Route;
import services.ActivityService;
import services.CategoryService;
import services.CustomerService;
import services.RouteService;

@Controller
@RequestMapping("/route/customer")
public class RouteCustomerController extends AbstractController {

	// =============== Services ===================

	@Autowired
	private RouteService routeService;

	@Autowired
	private ActivityService activityService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CustomerService customerService;
	
	// Listing ---------------------------------------------------------

		@RequestMapping(value = "/list2", method = RequestMethod.GET)
		public ModelAndView list2() {

			ModelAndView result;
			Collection<Route> routes;
			Customer principal;
			int customerId;

			principal = customerService.findByPrincipal();
			customerId = principal.getId();
			routes = routeService.findByCustomerId(customerId);

			result = new ModelAndView("route/list2");
			result.addObject("routes", routes);
			result.addObject("requestURI", "route/list2.do");

			return result;

		}
		
		@RequestMapping(value = "/listCustom", method = RequestMethod.GET)
		public ModelAndView listCustom() {

			ModelAndView result;
			Collection<Route> routes;

			routes = routeService.findAllCustom();

			result = new ModelAndView("route/list2");
			result.addObject("routes", routes);
			result.addObject("requestURI", "route/listCustom.do");

			return result;

		}

	// =============== Creation ===================

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView res;

		Route route = routeService.create();

		res = createEditModelAndView(route);
		return res;
	}

	// =============== Edition ====================

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int routeId) {

		ModelAndView result;
		Route route;

		route = routeService.findOne(routeId);
		Assert.notNull(route);
		result = createEditModelAndView(route);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid @ModelAttribute Route route, BindingResult binding) {

		ModelAndView result;

		if (binding.hasErrors()) {
			result = createEditModelAndView(route);
		} else {
			try {
				Customer customer= customerService.findByPrincipal();
				route.setCustomer(customer);
				route.setIsRandom(false);
				routeService.save(route);
				result = new ModelAndView("redirect:/");
			} catch (Throwable oops) {
				result = createEditModelAndView(route, "route.commit.error");
			}
		}
		return result;

	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(Route route, BindingResult binding) {

		ModelAndView result;

		try {
			routeService.delete(route);
			result = new ModelAndView("redirect:list.do");
		} catch (Throwable oops) {
			result = createEditModelAndView(route, "route.commit.error");
		}
		return result;

	}

	// =============== Ancillary Methods ==========

	protected ModelAndView createEditModelAndView(Route route) {
		ModelAndView res;

		res = createEditModelAndView(route, null);

		return res;
	}

	protected ModelAndView createEditModelAndView(Route route, String message) {
		ModelAndView res;
		Collection<Activity> activities;
		Collection<Category> categories;
		Customer principal;

		res = new ModelAndView("route/edit");
		activities = activityService.findAll();
		categories = categoryService.findAll();
		principal= customerService.findByPrincipal();
		res.addObject("route", route);
		res.addObject("activities", activities);
		res.addObject("categories", categories);
		res.addObject("principal", principal);
		res.addObject("message", message);

		return res;
	}

}