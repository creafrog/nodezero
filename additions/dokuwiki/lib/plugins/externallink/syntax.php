<?php
/**
 * Plugin bookmark: Creates a bookmark to your document.
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author     Otto Vainio <plugins@valjakko.net>
 */
 
if(!defined('DOKU_INC')) define('DOKU_INC',realpath(dirname(__FILE__).'/../../').'/');
if(!defined('DOKU_PLUGIN')) define('DOKU_PLUGIN',DOKU_INC.'lib/plugins/');
require_once(DOKU_PLUGIN.'syntax.php');
 
/**
 * All DokuWiki plugins to extend the parser/rendering mechanism
 * need to inherit from this class
 */
class syntax_plugin_externallink extends DokuWiki_Syntax_Plugin {
 
    /**
     * return some info
     */
    function getInfo(){
        return array(
            'author' => 'Otto Vainio',
            'email'  => 'plugins@valjakko.net',
            'date'   => '2007-02-26',
            'name'   => 'externallink',
            'desc'   => 'Inserts a link to a page outside your wiki, but on your server with a style of wikilink. Format is [[@/pagename|optional title]]',
            'url'    => 'http://wiki.splitbrain.org/wiki:plugins',
        );
    }
 
    /**
     * What kind of syntax are we?
     */
    function getType(){
        return 'substition';
    }
 
    // Just before build in links
    function getSort(){ return 299; }
 
    function connectTo($mode) {
        $this->Lexer->addSpecialPattern('\[\[\@.*?\]\]',$mode,'plugin_externallink');
    }
 
 
    /**
     * Handle the match
     */
    function handle($match, $state, $pos, &$handler){
        $match = substr($match,3,-2); //strip [[@ from start and ]] from end
        $match = explode("|",$match);
        return $match;
    }
 
    /**
     * Create output
     */
    function render($mode, &$renderer, $data) {
        if($mode == 'xhtml'){
            $text=$this->_externallink($renderer, $data[0], $data[1]);
            $renderer->doc .= $text;
            return true;
        }
        return false;
    }


    function _externallink(&$renderer, $url, $name = NULL) {
        global $conf;
        // Just some basic cleaning
        if(substr($url,0,7) == 'http://') {
          list($foo,$url) = explode("/",substr($url,7),2);
        }
        if(substr($url,0,5) == 'ftp://') {
          list($foo,$url) = explode("/",substr($url,6),2);
        }
        if (!isset($name)) {
          if (substr($url,0,1)=="/") { 
            $name=$_SERVER['HTTP_HOST'] . $url;
          } elseif (substr($url,0,1)=="?") { 
            $name=$_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'] . $url;
          } else {
            $name=$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']) . "/" . $url;
          }
        }

//        $name = $renderer->_xmlEntities($renderer->_getLinkTitle($name, $url, $isImage));
        $name = $renderer->_getLinkTitle($name, $url, $isImage);

        $class='wikilink1';
        $link['target'] = $conf['target']['wiki'];
        $link['style']  = '';
        $link['pre']    = '';
        $link['suf']    = '';
        $link['more']   = '';
        $link['class']  = $class;
        $link['url']    = $url;
        $link['name']   = $name;
        $link['title']  = $renderer->_xmlEntities($url);

        //output formatted
        return $renderer->_formatLink($link);
    }

}
?>