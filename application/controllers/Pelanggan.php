<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Pelanggan extends CI_Controller
{


	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_pelanggan');
		$this->load->model('m_auth');
	}

	public function register()
	{
		$this->form_validation->set_rules(
			'nama_pelanggan',
			'Nama Pelanggan',
			'required',
			array('required' => '%s Harus di isi !!!')
		);
		$this->form_validation->set_rules(
			'email',
			'E-mail',
			'required|is_unique[tbl_pelanggan.email]',
			array('required' => '%s Harus di isi !!!',
			'is_unique' => '%s email sudah terdaftar !!')
		);
		$this->form_validation->set_rules(
			'password',
			'Password',
			'required',
			array('required' => '%s Harus di isi !!!')
		);
		$this->form_validation->set_rules(
			'ulangi_password',
			'Ulangi Password',
			'required|matches[password]',
			array('required' => '%s Harus di isi !!!',
			'matches' => '%s Password tidak sama !!')
		);


		if ($this->form_validation->run() == FALSE) {

			$data = array(
				'title' => 'Register Pelanggan',
				'isi' => 'v_register',
			);
			$this->load->view('layout/v_wrapper_frontend', $data, false);
		} else {
			$data = array(
				'nama_pelanggan' => $this->input->post('nama_pelanggan'),
				'email' => $this->input->post('email'),
				'password' => $this->input->post('password'),
			);
			$this->m_pelanggan->register($data);
			$this->session->set_flashdata('pesan', 'Akun berhasil dibuat  !!');
			redirect('pelanggan/register');
		}
	} 

	public function  login()
	{
		$this->form_validation->set_rules('email', 'E-mail', 'required', array(
			'required' => '%s harus di isi!'
		));
		$this->form_validation->set_rules('password', 'Password', 'required', array(
			'required' => '%s harus di isi!'
		));
		
		if ($this->form_validation->run() == TRUE) {
			$email = $this->input->post('email');
			$password = $this->input->post('password');
			$this->pelanggan_login->login($email, $password);
		} 
		
		$data = array(
			'title' => 'Login Pelanggan',
			'isi' => 'v_login_pelanggan',
		);
		$this->load->view('layout/v_wrapper_frontend', $data, false);
	}

	public function logout()
	{
		$this->pelanggan_login->logout();
	}

	public function akun()
	{
		//proteksi halaman
		$this->pelanggan_login->proteksi_halaman();
		$data = array(
			'title' => 'Akun Saya',
			'isi' => 'v_akun_saya',
		);
		$this->load->view('layout/v_wrapper_frontend', $data, false);
	}
}
