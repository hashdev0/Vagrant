<?php 
namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class BlogController extends Controller {

	/**
	 * @Route("/blog/{page}", defaults={"page" = 1}, requirements={"page": "\d+"}, name="blog-page")
	 */
	public function indexAction($page) {
		return new Response("Page Number : ". $page);
	}

	/**
	 * @Route(
	 * 		"/articles/{_locale}/{year}/{title}.{_format}",
	 * 		defaults={"_format": "html"},
	 * 		requirements={
	 * 			"_locale": "en|fr",
	 * 			"_format": "html|rss|css",
	 *			"year": "\d+" 
	 * 		}
	 * )
	 */
	public function showAction($_locale, $year, $title) {		

		return new Response("From Show Action : local -> ". $_locale . " year -> ". $year . " title -> ". $title );
	}


	/**
	 * @Route("/blog/{slug}", name="app-blog")
	 */
	public function genericAction() {
		$params = $this->get('router')->match('/blog/app-blog');

		$uri = $this->get('router')->generate('app-blog', array('slug' => 'just-now'));
		$uriPage = $this->generateUrl('blog-page', array('page' => 400, 'category' => 'testing'));

		return $this->render('blog/generic.html.twig');
		//echo $uriPage;
		//echo $uri;

		//$response = new Response(json_encode($params));
		//$response->headers->set('Content-Type', 'application/json');
		//return $response;
	}
}
?>