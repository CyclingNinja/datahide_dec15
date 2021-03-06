{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}

{%- block any_cell scoped -%}
{%- if cell.metadata.get('slide_start', False) -%}
<section>
{%- endif -%}
{%- if cell.metadata.get('subslide_start', False) -%}
<section>
{%- endif -%}
{%- if cell.metadata.get('fragment_start', False) -%}
<div class="fragment">
{%- endif -%}

{%- if cell.metadata.slide_type == 'notes' -%}
<aside class="notes">
{{ super() }}
</aside>
{%- elif cell.metadata.slide_type == 'skip' -%}
{%- else -%}
{{ super() }}
{%- endif -%}

{%- if cell.metadata.get('fragment_end', False) -%}
</div>
{%- endif -%}
{%- if cell.metadata.get('subslide_end', False) -%}
</section>
{%- endif -%}
{%- if cell.metadata.get('slide_end', False) -%}
</section>
{%- endif -%}

{%- endblock any_cell -%}

{% block header %}
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1" />

<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

<title>{{resources['metadata']['name']}} slides</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- General and theme style sheets -->
<link rel="stylesheet" href="{{resources.reveal.url_prefix}}/css/reveal.css">
<link rel="stylesheet" href="{{resources.reveal.url_prefix}}/css/theme/simple.css" id="theme">

<!-- If the query includes 'print-pdf', include the PDF print sheet -->
<script>
if( window.location.search.match( /print-pdf/gi ) ) {
        var link = document.createElement( 'link' );
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = '{{resources.reveal.url_prefix}}/css/print/pdf.css';
        document.getElementsByTagName( 'head' )[0].appendChild( link );
}

</script>

<!--[if lt IE 9]>
<script src="{{resources.reveal.url_prefix}}/lib/js/html5shiv.js"></script>
<![endif]-->

<!-- Loading the mathjax macro -->
{{ mathjax() }}

<!-- Get Font-awesome from cdn -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css">

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<style type="text/css">
    /* Overrides of notebook CSS for static HTML export */
    .reveal {
      font-size: 160%;
      overflow-y: scroll;
    }
    .reveal pre {
      width: inherit;
      padding: 0.4em;
      margin: 0px;
      font-family: monospace, sans-serif;
      font-size: 80%;
      box-shadow: 0px 0px 0px rgba(0, 0, 0, 0);
    }
    .reveal pre code {
      padding: 0px;
    }
    .reveal section img {
      border: 0px solid black;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0);
    }
    .reveal i {
      font-style: normal;
      font-family: FontAwesome;
      font-size: 2em;
    }
    .reveal .slides {
      text-align: left;
    }
    .reveal.fade {
      opacity: 1;
    }
    .reveal .progress {
      position: static;
    }
    div.input_area {
      padding: 0.06em;
    }
    div.code_cell {
      background-color: transparent;
    }
    div.prompt {
      width: 11ex;
      padding: 0.4em;
      margin: 0px;
      font-family: monospace, sans-serif;
      font-size: 80%;
      text-align: right;
    }
    div.output_area pre {
      font-family: monospace, sans-serif;
      font-size: 80%;
    }
    div.output_prompt {
      /* 5px right shift to account for margin in parent container */
      margin: 5px 5px 0 0;
    }
    div.text_cell.rendered .rendered_html {
      /* The H1 height seems miscalculated, we are just hidding the scrollbar */
      overflow-y: hidden;
    }
    a.anchor-link {
      /* There is still an anchor, we are only hidding it */
      display: none;
    }
    .rendered_html p {
      text-align: inherit;
    }
</style>
<!-- For syntax highlighting -->
<link rel="stylesheet" href="reveal.js/lib/css/zenburn.css">
<!-- Custom stylesheet, it must be in the same directory as the html file -->
<link rel="stylesheet" href="custom.css">


<script src="/reveal.js/plugin/highlight/highlight.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<!-- ##################################################################### -->
<!-- UNCOMMENT THIS SECTION TO HIDE INPUT CODE                             -->
<!-- ##################################################################### -->
<!--

<style type="text/css">
//div.output_wrapper {
//  margin-top: 0px;
//}
.input_hidden {
  display: none;
//  margin-top: 5px;
}
</style>

<script>
$(document).ready(function(){
  $(".output_wrapper").click(function(){
      $(this).prev('.input_hidden').slideToggle();
  });
})
</script>
-->
<!-- ##################################################################### -->
</head>
{% endblock header%}


{% block body %}
<body>
<div class="reveal">
<div class="slides">
{{ super() }}
</div>
</div>

<script>

require(
    {
      // it makes sense to wait a little bit when you are loading
      // reveal from a cdn in a slow connection environment
      waitSeconds: 15
    },
    [
      "{{resources.reveal.url_prefix}}/lib/js/head.min.js",
      "{{resources.reveal.url_prefix}}/js/reveal.js"
    ],

    function(head, Reveal){

            // Full list of configuration options available here: https://github.com/hakimel/reveal.js#configuration
            Reveal.initialize({

            // Display controls in the bottom right corner
            //controls: true,

            // Display a presentation progress bar
            progress: true,

            // Push each slide change to the browser history
            //history: false,

            // Enable keyboard shortcuts for navigation
            keyboard: true,

            // Enable touch events for navigation
            //touch: true,

            // Enable the slide overview mode
            //overview: true,

            // Vertical centering of slides
            //center: true,

            // Loop the presentation
            //loop: false,

            // Change the presentation direction to be RTL
            //rtl: false,

            // Number of milliseconds between automatically proceeding to the
            // next slide, disabled when set to 0, this value can be overwritten
            // by using a data-autoslide attribute on your slides
            //autoSlide: 0,

            // Enable slide navigation via mouse wheel
            //mouseWheel: false,

            // Transition style
            transition: 'slide', // default/cube/page/concave/zoom/linear/fade/none

            // Transition speed
            //transitionSpeed: 'default', // default/fast/slow

            // Transition style for full page backgrounds
            //backgroundTransition: 'default', // default/linear/none

            // Theme
            theme: 'plain', // available themes are in /css/theme
            
            //size
            width: '80%',

            parallaxBackgroundImage: 'images/background_1.jpg',
            parallaxBackgroundSize: '3800px 1200px',

            slideNumber: true,

            // Optional libraries used to extend on reveal.js
            dependencies: [
                { src: "{{resources.reveal.url_prefix}}/lib/js/classList.js",
                  condition: function() { return !document.body.classList; } },
                { src: "{{resources.reveal.url_prefix}}/plugin/notes/notes.js",
                  async: true,
                  condition: function() { return !!document.body.classList; } }
            ]
        });


        var update = function(event){
          if(MathJax.Hub.getAllJax(Reveal.getCurrentSlide())){
            MathJax.Hub.Rerender(Reveal.getCurrentSlide());
          }
        };

        Reveal.addEventListener('slidechanged', update);

        var update_scroll = function(event){
          $(".reveal").scrollTop(0);
        };

        Reveal.addEventListener('slidechanged', update_scroll);

    }
);

</script>

</body>
{% endblock body %}

{% block footer %}
</html>
{% endblock footer %}
