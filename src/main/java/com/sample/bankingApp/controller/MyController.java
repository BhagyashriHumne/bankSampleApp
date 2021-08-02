package com.sample.bankingApp.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sample.bankingApp.model.Account;
import com.sample.bankingApp.model.Operations;
import com.sample.bankingApp.model.Role;
import com.sample.bankingApp.model.Transaction;
import com.sample.bankingApp.model.User;
import com.sample.bankingApp.repo.AccountRepository;
import com.sample.bankingApp.repo.CustomerRepository;
import com.sample.bankingApp.repo.TransactionRepository;
import com.sample.bankingApp.repo.UserRepository;

@EnableScheduling
@Controller
public class MyController {

	@Autowired
	public UserRepository userRepository;

	@Autowired
	public CustomerRepository customerRepository;

	@Autowired
	public AccountRepository accountRepository;

	@Autowired
	public TransactionRepository transactionRepository;

	@RequestMapping(value = "/createNewUser")
	public Object createNewUser(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("createUser");

		User user = new User();
		if (request.getParameter("id") != null && !request.getParameter("id").isEmpty())
			user.setId(Integer.parseInt(request.getParameter("id")));
		user.setActive(true);
		user.setAddressLine1(request.getParameter("addressLine1"));
		user.setAddressLine2(request.getParameter("addressLine2"));
		user.setAddressLine3(request.getParameter("addressLine3"));
		user.setContact(request.getParameter("contact"));
		user.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		user.setEmail(request.getParameter("email"));
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setPassword(request.getParameter("password"));
		user.setRole(request.getParameter("role"));
		userRepository.save(user);

		if (user.getRole().equals(Role.CUSTOMER.toString())) {
			request.setAttribute("customerId", user.getId());
			createNewAccount(request, response, model, session);
		}
		// List<User> userList = userRepository.getUserByRole(user.getRole());

		if (user.getRole().equalsIgnoreCase(Role.ADMIN.toString())) {
			List<User> userList = userRepository.getUserByRole(Role.EMPLOYEE.toString());
			modelAndView = new ModelAndView("createUser");
			modelAndView.addObject("thisUser", user);
			modelAndView.addObject("users", userList);
		} else if (user.getRole().equalsIgnoreCase(Role.EMPLOYEE.toString())) {
			List<User> userList = userRepository.getUserByRole(Role.CUSTOMER.toString());
			modelAndView = new ModelAndView("createUser");
			modelAndView.addObject("thisUser", user);
			modelAndView.addObject("users", userList);
		} else {
			modelAndView = new ModelAndView("header");
			modelAndView.addObject("thisUser", user);
		}

		return modelAndView;
	}

	@RequestMapping(value = "/callDeposite")
	public ModelAndView callDeposite(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		return new ModelAndView("deposite");
	}
	
	@RequestMapping(value = "/callBalance")
	public ModelAndView callBalance(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		return new ModelAndView("balance");
	}

	@RequestMapping(value = "/callWithdraw")
	public ModelAndView callWithdraw(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		return new ModelAndView("withDraw");
	}

	@RequestMapping(value = "/depositeMoney")
	public ModelAndView depositeMoney(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		ModelAndView modelView = new ModelAndView("errorPage");
		String errorMessage = "";
		Account account = accountRepository.getOne(Integer.parseInt(request.getParameter("accountNo")));
		double amount = Double.parseDouble(request.getParameter("amount"));
		if (account != null) {
			// modelView=new ModelAndView("header");
			Transaction transaction = new Transaction();
			transaction.setAccountId(account.getId());
			transaction.setAmount(amount);
			transaction.setOperation(Operations.DEPOSITE.toString());
			transaction.setBalance(account.getBalance() + amount);
			//transaction.setDate(new Timestamp(System.currentTimeMillis()));
			transactionRepository.save(transaction);

			account.setBalance(account.getBalance() + amount);
			accountRepository.save(account);
			errorMessage = "Amount Deposited and current balance is " + account.getBalance();

		} else
			errorMessage = "Account does not exists";
		modelView.addObject("errorPage", errorMessage);
		return modelView;
	}

	@RequestMapping(value = "/balance")
	public ModelAndView balance(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		ModelAndView modelView = new ModelAndView("errorPage");
		String errorMessage = "";
		Account account = accountRepository.getOne(Integer.parseInt(request.getParameter("accountNo")));
		if (account != null) {
			errorMessage = "Balance is " + account.getBalance();
		} else
			errorMessage = "Account does not exists";
		modelView.addObject("errorPage", errorMessage);
		return modelView;
	}

	/*
	 * @RequestMapping(value = "/viewAllTransactions") public void
	 * viewAllTransactions(HttpServletRequest request, HttpServletResponse response,
	 * Model model, HttpSession session) { List<Transaction> list =
	 * accountRepository.getAccountByAccountNo(Integer.parseInt(request.getParameter
	 * ("accountNo"))); double amount =
	 * Double.parseDouble(request.getParameter("amount")); if (account != null) {
	 * Transaction transaction = new Transaction();
	 * transaction.setAccountId(account.getId()); transaction.setAmount(amount);
	 * transaction.setOperation(Operations.DEPOSITE.toString());
	 * transaction.setBalance(account.getBalance() + amount);
	 * transaction.setDate(new Timestamp(System.currentTimeMillis()));
	 * transactionRepository.save(transaction);
	 * 
	 * account.setBalance(account.getBalance() + amount);
	 * accountRepository.save(account); }
	 * 
	 * }
	 */

	@RequestMapping(value = "/withdrawMoney")
	public ModelAndView withdrawMoney(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		ModelAndView modelView = new ModelAndView("errorPage");
		String errorMessage = "";
		Account account = accountRepository.getOne(Integer.parseInt(request.getParameter("accountNo")));
		double amount = Double.parseDouble(request.getParameter("amount"));
		if (account != null) {
			if (account.getBalance() > amount) {
				Transaction transaction = new Transaction();
				transaction.setAccountId(account.getId());
				transaction.setAmount(amount);
				transaction.setOperation(Operations.WITHDRAW.toString());
				transaction.setBalance(account.getBalance() - amount);
				//transaction.setDate(new Timestamp(System.currentTimeMillis()));
				transactionRepository.save(transaction);

				account.setBalance(account.getBalance() - amount);
				accountRepository.save(account);
				errorMessage = "Amount is withdrawn from account and current balance is " + account.getBalance();
			} else
				errorMessage = "Insufficient Balance";
		} else
			errorMessage = "Account does not exists";
		modelView.addObject("errorPage", errorMessage);
		return modelView;
	}

	@GetMapping(value = "/editUser")
	public Object editUser(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		ModelAndView view = new ModelAndView("editUser");

		User user = new User();
		if (request.getParameter("id") != null && !request.getParameter("id").isEmpty())
			user.setId(Integer.parseInt(request.getParameter("id")));
		user.setActive(true);
		user.setAddressLine1(request.getParameter("addressLine1"));
		user.setAddressLine2(request.getParameter("addressLine2"));
		user.setAddressLine3(request.getParameter("addressLine3"));
		user.setContact(request.getParameter("contact"));
		user.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		user.setEmail(request.getParameter("email"));
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setPassword(request.getParameter("password"));
		user.setRole(request.getParameter("role"));
		userRepository.save(user);

		List<User> userList = userRepository.getUserByRole(user.getRole());

		view.addObject("users", userList);
		return view;
	}

	@RequestMapping(value = "/callEditUser", method = RequestMethod.POST)
	public Object callEditUser(@RequestParam(value = "id") int id) {
		ModelAndView view = new ModelAndView("editUser");

		User user = null;
		if (id != 0)
			user = userRepository.getOne(id);
		if (user != null)
			view.addObject("selectedUser", user);
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("header");
		User user = null;
		if (session.getAttribute("userInfo") != null) {
			user = (User) session.getAttribute("userInfo");
		} else
			user = userRepository.findByEmailID(request.getParameter("username"));

		if (user != null) {
			if (user.getPassword().equals(request.getParameter("password"))) {
				if (user.getRole().equalsIgnoreCase(Role.ADMIN.toString())) {
					List<User> userList = userRepository.getUserByRole(Role.EMPLOYEE.toString());
					modelAndView = new ModelAndView("createUser");
					modelAndView.addObject("thisUser", user);
					modelAndView.addObject("users", userList);
				} else if (user.getRole().equalsIgnoreCase(Role.EMPLOYEE.toString())) {
					List<User> userList = userRepository.getUserByRole(Role.CUSTOMER.toString());
					modelAndView = new ModelAndView("createUser");
					modelAndView.addObject("thisUser", user);
					modelAndView.addObject("users", userList);
				} else {
					modelAndView = new ModelAndView("header");
					modelAndView.addObject("thisUser", user);
				}
			}
			session.setAttribute("userInfo", user);

		}

		return modelAndView;

	}

	@CrossOrigin
	@RequestMapping(value = "/createNewAccount", method = RequestMethod.POST)
	public void createNewAccount(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		Account account = new Account();
		account.setActive(true);
		account.setBalance(Double.parseDouble("0"));// request.getParameter("amount")
		account.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		account.setCustomerId((Integer) request.getAttribute("customerId"));
		account.setStatus("Active");
		accountRepository.save(account);
	}

	@RequestMapping(value = "/showLogin", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView homePage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// ModelAndView view = new ModelAndView("/createUser");
		if (session.getAttribute("userInfo") != null) {
			User user = (User) session.getAttribute("userInfo");
			ModelAndView modelAndView = new ModelAndView("login");

			if (user != null) {
				if (user.getRole().equalsIgnoreCase(Role.ADMIN.toString())) {
					List<User> userList = userRepository.getUserByRole(Role.EMPLOYEE.toString());
					modelAndView = new ModelAndView("createUser");
					modelAndView.addObject("thisUser", user);
					modelAndView.addObject("users", userList);
				} else if (user.getRole().equalsIgnoreCase(Role.EMPLOYEE.toString())) {
					List<User> userList = userRepository.getUserByRole(Role.CUSTOMER.toString());
					modelAndView = new ModelAndView("createUser");
					modelAndView.addObject("thisUser", user);
					modelAndView.addObject("users", userList);
				} else {
					modelAndView = new ModelAndView("header");
					modelAndView.addObject("thisUser", user);
				}
			}
			return modelAndView;
		}

		return new ModelAndView("/login");

	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		return new ModelAndView("/login");
	}

	@ResponseBody
	@GetMapping(value = "/getUserById")
	public User getUserById(@RequestParam(value = "id") int id) {
		User user = userRepository.getOne(id);
		return user;
	}

}
