<?php 

class ControllerAccountRegister extends Controller {

	private $error = array();

	      

  	public function index() {

		if ($this->customer->isLogged()) {

	  		$this->redirect($this->url->link('account/account', '', 'SSL'));

    	}



    	$this->language->load('account/register');

		

		$this->document->setTitle($this->language->get('heading_title'). ' | Наш протеин');

		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');

		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');

					

		$this->load->model('account/customer');

		

    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_account_customer->addCustomer($this->request->post);



			$this->customer->login($this->request->post['email'], $this->request->post['password']);

			

			unset($this->session->data['guest']);

			

			
							  	  

	  		$this->redirect($this->url->link('account/success'));

    	} 



      	$this->data['breadcrumbs'] = array();



      	$this->data['breadcrumbs'][] = array(

        	'text'      => $this->language->get('text_home'),

			'href'      => $this->url->link('common/home'),        	

        	'separator' => false

      	); 



      	$this->data['breadcrumbs'][] = array(

        	'text'      => $this->language->get('text_account'),

			'href'      => $this->url->link('account/account', '', 'SSL'),      	

        	'separator' => $this->language->get('text_separator')

      	);

		

      	$this->data['breadcrumbs'][] = array(

        	'text'      => $this->language->get('text_register'),

			'href'      => $this->url->link('account/register', '', 'SSL'),      	

        	'separator' => $this->language->get('text_separator')

      	);

		

    	$this->data['heading_title'] = $this->language->get('heading_title');

		

		$this->data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', 'SSL'));

		$this->data['text_your_details'] = $this->language->get('text_your_details');

    	$this->data['text_your_address'] = $this->language->get('text_your_address');

    	$this->data['text_your_password'] = $this->language->get('text_your_password');

		$this->data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->data['text_yes'] = $this->language->get('text_yes');

		$this->data['text_no'] = $this->language->get('text_no');

		$this->data['text_select'] = $this->language->get('text_select');

		$this->data['text_none'] = $this->language->get('text_none');

						

    	$this->data['entry_firstname'] = $this->language->get('entry_firstname');

    	$this->data['entry_lastname'] = $this->language->get('entry_lastname');

    	$this->data['entry_email'] = $this->language->get('entry_email');

    	$this->data['entry_telephone'] = $this->language->get('entry_telephone');

    	$this->data['entry_fax'] = $this->language->get('entry_fax');

		$this->data['entry_company'] = $this->language->get('entry_company');

		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');

		$this->data['entry_company_id'] = $this->language->get('entry_company_id');

		$this->data['entry_tax_id'] = $this->language->get('entry_tax_id');

    	$this->data['entry_address_1'] = $this->language->get('entry_address_1');

    	$this->data['entry_address_2'] = $this->language->get('entry_address_2');

    	$this->data['entry_postcode'] = $this->language->get('entry_postcode');

    	$this->data['entry_city'] = $this->language->get('entry_city');

    	$this->data['entry_country'] = $this->language->get('entry_country');

    	$this->data['entry_zone'] = $this->language->get('entry_zone');

		$this->data['entry_newsletter'] = $this->language->get('entry_newsletter');

    	$this->data['entry_password'] = $this->language->get('entry_password');

    	$this->data['entry_confirm'] = $this->language->get('entry_confirm');



		$this->data['button_continue'] = $this->language->get('button_continue');

    

		if (isset($this->error['warning'])) {

			$this->data['error_warning'] = $this->error['warning'];

		} else {

			$this->data['error_warning'] = '';

		}

		

		if (isset($this->error['firstname'])) {

			$this->data['error_firstname'] = $this->error['firstname'];

		} else {

			$this->data['error_firstname'] = '';

		}	

		

		if (isset($this->error['email'])) {

			$this->data['error_email'] = $this->error['email'];

		} else {

			$this->data['error_email'] = '';

		}

		

		if (isset($this->error['telephone'])) {

			$this->data['error_telephone'] = $this->error['telephone'];

		} else {

			$this->data['error_telephone'] = '';

		}

		

		if (isset($this->error['password'])) {

			$this->data['error_password'] = $this->error['password'];

		} else {

			$this->data['error_password'] = '';

		}

		

 		if (isset($this->error['confirm'])) {

			$this->data['error_confirm'] = $this->error['confirm'];

		} else {

			$this->data['error_confirm'] = '';

		}

		

  		

		

    	$this->data['action'] = $this->url->link('account/register', '', 'SSL');

		

		if (isset($this->request->post['firstname'])) {

    		$this->data['firstname'] = $this->request->post['firstname'];

		} else {

			$this->data['firstname'] = '';

		}



		

		

		if (isset($this->request->post['email'])) {

    		$this->data['email'] = $this->request->post['email'];

		} else {

			$this->data['email'] = '';

		}

		

		if (isset($this->request->post['telephone'])) {

    		$this->data['telephone'] = $this->request->post['telephone'];

		} else {

			$this->data['telephone'] = '';

		}

		

		



		$this->load->model('account/customer_group');

		

		$this->data['customer_groups'] = array();

		

		if (is_array($this->config->get('config_customer_group_display'))) {

			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			

			foreach ($customer_groups as $customer_group) {

				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {

					$this->data['customer_groups'][] = $customer_group;

				}

			}

		}

		

		if (isset($this->request->post['customer_group_id'])) {

    		$this->data['customer_group_id'] = $this->request->post['customer_group_id'];

		} else {

			$this->data['customer_group_id'] = $this->config->get('config_customer_group_id');

		}

		

				

		if (isset($this->request->post['password'])) {

    		$this->data['password'] = $this->request->post['password'];

		} else {

			$this->data['password'] = '';

		}

		

		if (isset($this->request->post['confirm'])) {

    		$this->data['confirm'] = $this->request->post['confirm'];

		} else {

			$this->data['confirm'] = '';

		}

		

		if (isset($this->request->post['newsletter'])) {

    		$this->data['newsletter'] = $this->request->post['newsletter'];

		} else {

			$this->data['newsletter'] = '';

		}	



		if ($this->config->get('config_account_id')) {

			$this->load->model('catalog/information');

			

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			

			if ($information_info) {

				$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);

			} else {

				$this->data['text_agree'] = '';

			}

		} else {

			$this->data['text_agree'] = '';

		}

		

		if (isset($this->request->post['agree'])) {

      		$this->data['agree'] = $this->request->post['agree'];

		} else {

			$this->data['agree'] = false;

		}

		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {

			$this->template = $this->config->get('config_template') . '/template/account/register.tpl';

		} else {

			$this->template = 'default/template/account/register.tpl';

		}

		

		$this->children = array(

			'common/column_left',

			'common/column_right',

			'common/content_top',

			'common/content_bottom',

			'common/footer',

			'common/header'	

		);

				

		$this->response->setOutput($this->render());	

  	}



  	protected function validate() {

    	if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {

      		$this->error['firstname'] = $this->language->get('error_firstname');

    	}



    	



    	if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {

      		$this->error['email'] = $this->language->get('error_email');

    	}



    	if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {

      		$this->error['warning'] = $this->language->get('error_exists');

    	}

		

    	if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {

      		$this->error['telephone'] = $this->language->get('error_telephone');

    	}

		

		// Customer Group

		$this->load->model('account/customer_group');

		

		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {

			$customer_group_id = $this->request->post['customer_group_id'];

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}



		$customer_group = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

			

		

			



    	if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {

      		$this->error['password'] = $this->language->get('error_password');

    	}



    	if ($this->request->post['confirm'] != $this->request->post['password']) {

      		$this->error['confirm'] = $this->language->get('error_confirm');

    	}

		

		if ($this->config->get('config_account_id')) {

			$this->load->model('catalog/information');

			

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			

			if ($information_info && !isset($this->request->post['agree'])) {

      			$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);

			}

		}

		

    	if (!$this->error) {

      		return true;

    	} else {

      		return false;

    	}

  	}

	

	public function country() {

		$json = array();

		

		$this->load->model('localisation/country');



    	$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		

		if ($country_info) {

			$this->load->model('localisation/zone');



			$json = array(

				'country_id'        => $country_info['country_id'],

				'name'              => $country_info['name'],

				'iso_code_2'        => $country_info['iso_code_2'],

				'iso_code_3'        => $country_info['iso_code_3'],

				'address_format'    => $country_info['address_format'],

				'postcode_required' => $country_info['postcode_required'],

				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),

				'status'            => $country_info['status']		

			);

		}

		

		$this->response->setOutput(json_encode($json));

	}	

}

?>