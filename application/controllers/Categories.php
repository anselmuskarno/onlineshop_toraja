<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Categories extends CI_Controller
{

	public function miniatur()
	{
		$data['title'] = 'Kategori Miniatur';
		$data['miniatur'] = $this->model_kategori->miniatur()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('miniatur', $data);
		$this->load->view('layout/home/footer');
	}

	public function kain_tenun()
	{
		$data['title'] = 'Kategori Kain Tenun';
		$data['kain_tenun'] = $this->model_kategori->kain_tenun()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('kain_tenun', $data);
		$this->load->view('layout/home/footer');
	}

	public function tikar()
	{
		$data['title'] = 'Kategori Tikar';
		$data['tikar'] = $this->model_kategori->tikar()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('tikar', $data);
		$this->load->view('layout/home/footer');
	}

	public function tas()
	{
		$data['title'] = 'Kategori Tas';
		$data['tas'] = $this->model_kategori->tas()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('tas', $data);
		$this->load->view('layout/home/footer');
	}

	public function ukiran()
	{
		$data['title'] = 'Kategori Ukiran';
		$data['ukiran'] = $this->model_kategori->ukiran()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('ukiran', $data);
		$this->load->view('layout/home/footer');
	}

	public function aksesoris()
	{
		$data['title'] = 'Aksesoris';
		$data['aksesoris'] = $this->model_kategori->aksesoris()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('aksesoris', $data);
		$this->load->view('layout/home/footer');
	}
}
