<!DOCTYPE html>

<html lang="en">

<head>

  <title>NLP Parse Visualization</title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" type="text/css" href="resources/jquery-ui-1.9.2.custom.css">
  <link rel="stylesheet" type="text/css" href="resources/font-awesome.min.css">

  <link rel="stylesheet" type="text/css" href="resources/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/dagre-d3-simple.css">
  <link rel="stylesheet" type="text/css" href="css/digraph.css">

  <script type="text/javascript" src="resources/jquery-2.0.0.min.js"></script>
  <script type="text/javascript" src="resources/jquery.form.min.js"></script>
  <script type="text/javascript" src="resources/d3.min.js"></script>
  <script type="text/javascript" src="resources/dagre.min.js"></script>
  <script src="resources/dagre-d3-simple.js"></script>

</head>

<body>

<div id="attach">
  <svg class="main-svg" id="svg-canvas"></svg>
</div>

<script>

	var dataParsed = ${obj} ;
	

	var nodes = {};
	var edges = [];
	
	dataParsed.forEach(function (e) {
	  populate(e, nodes, edges);
	});
	
	renderJSObjsToD3(nodes, edges, ".main-svg");

  function populate(data, nodes, edges) {
    var nodeID = Object.keys(nodes).length;

    var newNode = {
      label: (data.data.type == "TK") ? data.data.word : data.data.type,
      id: nodeID + ""
    };

    var classes = ["type-" + data.data.type];
    if (data.data.ne) {
      classes.push("ne-" + data.data.ne);
    }

    newNode.nodeclass = classes.join(" ");

    //  I hate javascript
    nodes[nodeID] = newNode;

    data.children.forEach(function (child) {
      var newChild = populate(child, nodes, edges);

      edges.push({
        source: newNode.id,
        target: newChild.id,
        id: newNode.id + "-" + newChild.id
      });
    });

    return newNode;
  }


  function buildGraphData(node, nodes, links) {

    var index = nodes.length;
    nodes.push({
      name: node.data.content,
      group: 1
    });

    node.children.forEach(function (e) {
      links.push({
        source: index,
        target: nodes.length,
        value: 2
      });
      buildGraphData(e, nodes, links);
    });
  }


</script>


</body>

</html>
