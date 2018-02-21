<?php
namespace App\Controller\Home;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use App\Util\Desktop\BarTop;

class IndexController extends Controller
{
    public function login(Request $objRequest)
    {
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirect($this->generateUrl('home'));
        }
        
        $helper = $this->get('security.authentication_utils');
        return $this->render(
            'auth/login.html.twig',
            [
                'last_username' => $helper->getLastUsername(),
                'error'         => $helper->getLastAuthenticationError(),
            ]
        );
    }
    
    public function loginCheck()
    {
        
    }
    
    
    public function logout()
    {
        $this->get('security.context')->setToken(null);
        $this->get('request')->getSession()->invalidate();
    }
    
    public function home(Request $objRequest)
    {
        if (!$this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirect($this->generateUrl('login'));
        }
        $objBarTop = new BarTop($this->getUser());
        return $this->render('base/base.html.twig',  [
            'title' => "Compra Ágil",
            'desktop' => [
                'icons' => [
                    [
                        'left' => 20,
                        'top' => 20,
                        'href' => '#icon_dock_computer',
                        'src' => '../css/jquery/desktop/images/icons/icon_32_addgroup.png',
                        'text' => 'Permissão'
                    ],
                    [
                        'left' => 20,
                        'top' => 100,
                        'href' => '#icon_dock_drive',
                        'src' => '../css/jquery/desktop/images/icons/icon_32_drive.png',
                        'text' => 'Hard Drive'
                    ]
                ],
                'windows' => [
                    [
                        'id' => 'window_computer',
                        'window_inner' => [
                            'text' => 'Build: TK421',
                            'window_top' => [
                                'float_left'=> [
                                    'text' => 'Computer 11',
                                    'image' => '<img src="../css/jquery/desktop/images/icons/icon_16_addgroup.png" />'
                                ],
                                'float_right'=> [
                                    'href' => 'icon_dock_computer'
                                ],
                            ],
                            'window_content' => [
                                'text'=> 'Hello. You look nice today!',
                                'table'=> [
                                    'thead' => [
                                        [
                                            [
                                                'class' => 'shrink',
                                                'text' => '&nbsp;'
                                            ],
                                            ['text' => 'Name'],
                                            ['text' => 'Date Modified'],
                                            ['text' => 'Date Created'],
                                            ['text' => 'Size'],
                                            ['text' => 'Kind']
                                        ]
                                    ],
                                    'tbody' => [
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_drive.png" />'],
                                            ['text' => 'Hard Drive'],
                                            ['text' => 'Today'],
                                            ['text' => '&mdash;'],
                                            ['text' => '200 GB'],
                                            ['text' => 'Volume']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_disc.png" />'],
                                            ['text' => 'Audio CD'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => '2.92 GB'],
                                            ['text' => 'Media']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_network.png" />'],
                                            ['text' => 'Network'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'LAN']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_folder_remote.png" />'],
                                            ['text' => 'Shared Project Files'],
                                            ['text' => 'Yesterday'],
                                            ['text' => '12/29/08'],
                                            ['text' => '524 MB'],
                                            ['text' => 'Folder']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_documents.png" />'],
                                            ['text' => 'Documents'],
                                            ['text' => 'Yesterday'],
                                            ['text' => '12/29/08'],
                                            ['text' => '524 MB'],
                                            ['text' => 'Folder']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_system.png" />'],
                                            ['text' => 'Preferences'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'System']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_trash.png" />'],
                                            ['text' => 'Trash'],
                                            ['text' => 'Today'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'Bin']
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ],
                    [
                        'id' => 'window_drive',
                        'window_inner' => [
                            'text' => 'Free: 80.9 GB',
                            'window_top' => [
                                'float_left'=> [
                                    'text' => 'Hard Drive',
                                    'image' => '<img src="../css/jquery/desktop/images/icons/icon_16_drive.png" />'
                                ],
                                'float_right'=> [
                                    'href' => 'icon_dock_drive'
                                ],
                            ],
                            'window_content' => [
                                'text'=> 'Storage in use: 119.1 GB',
                                'table'=> [
                                    'thead' => [
                                        [
                                            [
                                                'class' => 'shrink',
                                                'text' => '&nbsp;'
                                            ],
                                            ['text' => 'Name'],
                                            ['text' => 'Date Modified'],
                                            ['text' => 'Date Created'],
                                            ['text' => 'Size'],
                                            ['text' => 'Kind']
                                        ]
                                    ],
                                    'tbody' => [
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_page.png" />'],
                                            ['text' => '.DS_Store'],
                                            ['text' => 'Yesterday'],
                                            ['text' => '&mdash;'],
                                            ['text' => '6 KB'],
                                            ['text' => 'Hidden']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_folder_home.png" />'],
                                            ['text' => 'Default User'],
                                            ['text' => 'Today'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'Folder']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_folder.png" />'],
                                            ['text' => 'Applications'],
                                            ['text' => 'Yesterday'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'Folder']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_folder.png" />'],
                                            ['text' => 'Developer'],
                                            ['text' => '12/29/08'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'Folder']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_folder.png" />'],
                                            ['text' => 'Library'],
                                            ['text' => '09/11/09'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'Folder']
                                        ],
                                        [
                                            ['text' => '<img src="../css/jquery/desktop/images/icons/icon_16_folder.png" />'],
                                            ['text' => 'System'],
                                            ['text' => 'Yesterday'],
                                            ['text' => '&mdash;'],
                                            ['text' => '&mdash;'],
                                            ['text' => 'Folder']
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            'dock' => [
                [
                    'id' => 'icon_dock_computer',
                    'href' => '#window_computer',
                    'src' => '../css/jquery/desktop/images/icons/icon_22_addgroup.png',
                    'text' => 'Computer'
                ],
                [
                    'id' => 'icon_dock_drive',
                    'href' => '#window_drive',
                    'src' => '../css/jquery/desktop/images/icons/icon_22_drive.png',
                    'text' => 'Hard Drive'
                ]
            ],
            'bar_top' => [
                [
                    'href' => '#',
                    'text' => 'Market Sales Domain',//Domínio de vendas no mercado
                    'ul'=> []
                ],
                [
                    'href' => '#',
                    'text' => 'Product Domain',//Domínio do Produto
                    'ul'=> []
                ],
                [
                    'href' => '#',
                    'text' => 'Customer Domain',//Domínio do Cliente
                    'ul'=> []
                ],
                [
                    'href' => '#',
                    'text' => 'Service Domain',//Domínio de Serviço
                    'ul'=> []
                ],
                [
                    'href' => '#',
                    'text' => 'Resource Domain',//Domínio de Recursos
                    'ul'=> []
                ],
                [
                    'href' => '#',
                    'text' => 'Engaged Party Domain',//Domínio do grupo contratado
                    'ul'=> []
                ],
                [
                    'href' => '#',
                    'text' => 'Enterprise Domain',//Domínio Empresarial
                    'ul'=> []
                ],
                [
                    'href' => '#',
                    'text' => 'Common Process Patterns Domain',//Padrões comuns de processos
                    'ul'=> []
                ]
            ]
        ]);
    }
}
