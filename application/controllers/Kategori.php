<?php 


defined('BASEPATH') OR exit('No direct script access allowed');

class Kategori extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	$this->load->model('m_kategori');
	

	}

	// List all your items
	public function index()
	{
		$data = array(
			'title' => 'kategori',
			'kategori' => $this->m_kategori->get_all_data(),
			'isi' => 'v_kategori',
		);
		$this->load->view('layout/v_wrapper_backend', $data, false);
	}

	// Add a new item
	public function add()
	{
		{
			$data = array(
				'nama_kategori' => $this->input->post('nama_kategori'),
		
			);
			$this->m_kategori->add($data);
			$this->session->set_flashdata('pesan', 'data berhasil ditambahkan!!!');
			redirect('kategori');
		}
	
	}

	//Update one item
	public function edit($id_kategori = NULL)
	{
		$data = array(
			'id_kategori' => $id_kategori,
			'nama_kategori' => $this->input->post('nama_kategori'),
		);
		$this->m_kategori->edit($data);
		$this->session->set_flashdata('pesan', 'data berhasil Diedit!!');
		redirect('kategori');
	}

	//Delete one item
	public function delete($id_kategori = NULL)
	{
		$data = array('id_kategori' => $id_kategori);
		$this->m_kategori->delete($data);
		$this->session->set_flashdata('pesan', 'data berhasil dihapus!!');
		redirect('kategori');
	}
}

/* End of file Controllername.php */


?>
