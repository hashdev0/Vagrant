<?php 
namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class HelloController extends Controller {

	/**
	 * @Route("/hello")
	 */
	public function indexAction(Request $request) {
		$this->addFlash(
			'notice',
			'Your Changes were saved'
		);

		return $this->redirectToRoute('homepage');
	}
}
?>