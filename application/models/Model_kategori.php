<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Model_kategori extends CI_Model
{
	public function miniatur()
	{
		return $this->db->get_where('product', array('kategori' => 'Miniatur'));
	}

	public function kain_tenun()
	{
		return $this->db->get_where('product', array('kategori' => 'Kain Tenun'));
	}

	public function tikar()
	{
		return $this->db->get_where('product', array('kategori' => 'Tikar'));
	}

	public function tas()
	{
		return $this->db->get_where('product', array('kategori' => 'Tas'));
	}

	public function ukiran()
	{
		return $this->db->get_where('product', array('kategori' => 'Ukiran'));
	}

	public function aksesoris()
	{
		return $this->db->get_where('product', array('kategori' => 'Aksesoris'));
	}
}
