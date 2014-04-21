<?php
/**
 * Plugin base links: Creates links relative to site root for all links beginning with "/"
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author     Robert Meerman <robert.meerman@gmail.com>
 * @based_on   "externallink" plugin by Otto Vainio <plugins@valjakko.net>
 */
 
if(!defined('DOKU_INC')) define('DOKU_INC',realpath(dirname(__FILE__).'/../../').'/');
if(!defined('DOKU_PLUGIN')) define('DOKU_PLUGIN',DOKU_INC.'lib/plugins/');
require_once(DOKU_PLUGIN.'syntax.php');
 
/**
 * All DokuWiki plugins to extend the parser/rendering mechanism
 * need to inherit from this class
 */
class syntax_plugin_baselink extends DokuWiki_Syntax_Plugin {
 
    /**
     * return some info
     */
    function getInfo(){
        return array(
            'author' => 'Robert Meerman, based on externallink plugin by Otto Vainio',
            'email'  => 'robert.meerman@gmail.com',
            'date'   => '2007-05-19',
            'name'   => 'baselink',
            'desc'   => 'Makes links beginning with "/" present as (always valid) internal links that point relative to your domain\'s root. Format is [[/pagename|optional title]]',
            'url'    => 'http://wiki.splitbrain.org/plugin:baselink',
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
		// \x2F = "/"
        $this->Lexer->addSpecialPattern('\[\[\\x2F.*?\]\]',$mode,'plugin_baselink');
    }
 
 
    /**
     * Handle the match
     */
    function handle($match, $state, $pos, &$handler){
        $match = substr($match,2,-2); //strip [[ from start and ]] from end
        $match = explode("|",$match, 2);
        if( preg_match('/^\{\{[^\}]+\}\}$/',$match[1]) ){
			// If the title is an image, convert it to an array containing the image details
			$match[1] = Doku_Handler_Parse_Media($match[1]);
		}
        return $match;
    }
 
    /**
     * Create output
     */
    function render($mode, &$renderer, $data) {
        if($mode == 'xhtml'){
            $text=$this->_baselink($renderer, $data[0], $data[1]);
            $renderer->doc .= $text;
            return true;
        }
        return false;
    }
 
 
    function _baselink(&$renderer, $url, $name = NULL) {
        global $conf;
 
        // Media in titles ( "{{...}}" ) are presented as arrays at this stage
        if(is_array($name)){
			$name = $renderer->_getLinkTitle($name, $url, $isImage);
		}
		else{
			// Quick Fix to supress naming bug ("[[/base/link|This & That]]" --displayed-as--> "This &amp; That")
			//$name = $renderer->_xmlEntities($renderer->_getLinkTitle($name, $url, $isImage));
			$name = $renderer->_getLinkTitle($name, $url, $isImage);
		}
 
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
