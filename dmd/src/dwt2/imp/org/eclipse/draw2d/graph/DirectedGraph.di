/*******************************************************************************
 * Copyright (c) 2003, 2005 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/
module org.eclipse.draw2d.graph.DirectedGraph;

import java.lang.all;

import org.eclipse.draw2d.PositionConstants;
import org.eclipse.draw2d.geometry.Dimension;
import org.eclipse.draw2d.geometry.Insets;
import org.eclipse.draw2d.graph.EdgeList;
import org.eclipse.draw2d.graph.NodeList;
import org.eclipse.draw2d.graph.Node;
import org.eclipse.draw2d.graph.RankList;
import org.eclipse.draw2d.graph.Edge;
import org.eclipse.draw2d.graph.Rank;

/**
 * A graph consisting of nodes and directed edges.  A DirectedGraph serves as the input to
 * a graph layout algorithm.  The algorithm will place the graph's nodes and edges
 * according to certain goals, such as short, non-crossing edges, and readability.
 *
 * @author hudsonr
 * @since 2.1.2
 */
public class DirectedGraph {

private int direction = PositionConstants.SOUTH;

/**
 * The default padding to be used for nodes which don't specify any padding.  Padding is
 * the amount of empty space to be left around a node.  The default value is undefined.
 */
private Insets defaultPadding;

/**
 * All of the edges in the graph.
 */
public EdgeList edges;

/**
 * All of the nodes in the graph.
 */
public NodeList nodes;

/**
 * For internal use only. The list of rows which makeup the final graph layout.
 * @deprecated
 */
public RankList ranks;

Node forestRoot;
Insets margin;
int[] rankLocations;
int[][] cellLocations;
int tensorStrength;
int tensorSize;
Dimension size;

public this(){
    defaultPadding = new Insets(16);
    edges = new EdgeList();
    nodes = new NodeList();
    ranks = new RankList();
    margin = new Insets();
    size = new Dimension();
}

/**
 * Returns the default padding for nodes.
 * @return the default padding
 * @since 3.2
 */
public Insets getDefaultPadding() {
    return defaultPadding;
}

/**
 * Returns the direction in which the graph will be layed out.
 * @return the layout direction
 * @since 3.2
 */
public int getDirection() {
    return direction;
}

/**
 * Sets the outer margin for the entire graph. The margin is the space in which nodes
 * should not be placed.
 * @return the graph's margin
 * @since 3.2
 */
public Insets getMargin() {
    return margin;
}

/**
 * Returns the effective padding for the given node.  If the node has a specified padding,
 * it will be used, otherwise, the graph's defaultPadding is returned.  The
 * returned value must not be modified.
 * @param node the node
 * @return the effective padding for that node
 */
public Insets getPadding(Node node) {
    Insets pad = node.getPadding();
    if (pad is null)
        return defaultPadding;
    return pad;
}

int[] getCellLocations(int rank) {
    return cellLocations[rank];
}

int[] getRankLocations() {
    return rankLocations;
}
//
//public Cell getCell(Point pt) {
//  int rank = 0;
//  while (rank < rankLocations.length - 1 && rankLocations[rank] < pt.y)
//      rank++;
//  int cells[] = cellLocations[rank];
//  int cell = 0;
//  while (cell < cells.length - 1 && cells[cell] < pt.x)
//      cell++;
//  return new Cell(rank, cell, ranks.getRank(rank).getNode(index));
//}

public Node getNode(int rank, int index) {
    if (ranks.size() <= rank)
        return null;
    Rank r = ranks.getRank(rank);
    if (r.size() <= index)
        return null;
    return r.getNode(index);
}

/**
 * Removes the given edge from the graph.
 * @param edge the edge to be removed
 */
public void removeEdge(Edge edge) {
    edges.remove(edge);
    edge.source.outgoing.remove(edge);
    edge.target.incoming.remove(edge);
    if (edge.vNodes !is null)
        for (int j = 0; j < edge.vNodes.size(); j++)
            removeNode(edge.vNodes.getNode(j));
}

/**
 * Removes the given node from the graph. Does not remove the node's edges.
 * @param node the node to remove
 */
public void removeNode(Node node) {
    nodes.remove(node);
    if (ranks !is null)
        ranks.getRank(node.rank).remove(node);
}

/**
 * Sets the default padding for all nodes in the graph.  Padding is the empty space left
 * around the <em>outside</em> of each node.  The default padding is used for all nodes
 * which do not specify a specific amount of padding (i.e., their padding is
 * <code>null</code>).
 * @param insets the padding
 */
public void setDefaultPadding(Insets insets) {
    defaultPadding = insets;
}

/**
 * Sets the layout direction for the graph. Edges will be layed out in the specified
 * direction (unless the graph contains cycles). Supported values are:
 * <UL>
 * <LI>{@link org.eclipse.draw2d.PositionConstants#EAST}
 * <LI>{@link org.eclipse.draw2d.PositionConstants#SOUTH}
 * </UL>
 * <P>The default direction is south.
 * @param direction the layout direction
 * @since 3.2
 */
public void setDirection(int direction) {
    this.direction = direction;
}

//public void setGraphTensor(int length, int strength) {
//  tensorStrength = strength;
//  tensorSize = length;
//}

/**
 * Sets the graphs margin.
 * @param insets the graph's margin
 * @since 3.2
 */
public void setMargin(Insets insets) {
    this.margin = insets;
}

public Dimension getLayoutSize() {
    return size;
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
