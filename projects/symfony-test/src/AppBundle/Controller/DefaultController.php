<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Entity\Product;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', array(
            'base_dir' => realpath($this->container->getParameter('kernel.root_dir').'/..'),
        ));
    }
    /**
     * @Route("/create")
     */
    public function createAction() {
        $product = new Product();
        $product->setName('A Foo Bar');
        $product->setPrice('34.33');
        $product->setDescription('A Foo Bar Description here');

        $em = $this->getDoctrine()->getManager();
        $em->persist($product);
        $em->flush();

        return new Response('Created product Id : '. $product->getId());
    }

    /**
     * @Route("/showdata/{id}", name="showdata") 
     */
    public function showdataAction($id)
    {
        $product = $this->getDoctrine()->getRepository("AppBundle:Product")->find($id);

        if(!$product) {
            throw new Exception("Error Processing Request", 1);            
        }

        return new Response('Product Name is : '. $product->getName());
    }

    /**
     * @Route("/update/{id}")
     */
    public function updateAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $product = $em->getRepository('AppBundle:Product')->find($id);

        if(!$product) {
            throw new Exception("Error Processing Request", 1);
            
        }

        $product->setName('Harsha Udayanga');
        $product->setPrice('2222.50');
        $em->flush();

        return $this->redirectToRoute('homepage');
    }

    /**
     * @Route("/remove/{id}")
     */
    public function remove($id){
        $em = $this->getDoctrine()->getManager();

        $product = $em->getRepository('AppBundle:Product')->find($id);
        $em->remove($product);
        $em->flush();

        return $this->redirectToRoute('homepage');
    }
   
    
}
