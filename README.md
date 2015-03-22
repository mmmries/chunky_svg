Chunky SVG
=========

This library is inspired by [the Ruby library "Chunky PNG"](https://github.com/wvanbergen/chunky_png).

It is meant as an experiment to play with the idea of representing expressing charts or visualizations in a higher-level language that renders down to SVG.

Project Status
==============

This is a for-fun and for-learning project. It is not being used in any production systems that I am aware of.

What Can I Draw?
================

You can drawn any of the SVG primitives like this:

```elixir
ChunkySVG.render([{:circle, %{cx: 50, cy: 50, r: 40}, nil}])
```

Which would generate this:

<svg viewBox="0 0 100 100" height="100" width="100">
  <circle cx="50" cy="50" r="40" />
</svg>

ChunkySVG also knows how to draw other things in terms of SVG primitives:

<table>
  <tr>
    <td>
      `{:hexagon, %{cx: 50, cy: 50, r: 40}}`
    </td>
    <td>
      <img height="100" width="100" src="http://mmmries.github.io/chunky_svg/examples/hexagon.svg" />
    </td>
  </tr>
  <tr>
    <td>
      `{:pentagon, %{cx: 50, cy: 50, r: 40}}`
    </td>
    <td>
      <img height="100" width="100" src="http://mmmries.github.io/chunky_svg/examples/pentagon.svg" />
    </td>
  </tr>
  <tr>
    <td>
      `{:octagon, %{cx: 50, cy: 50, r: 40}}`
    </td>
    <td>
      <img height="100" width="100" src="http://mmmries.github.io/chunky_svg/examples/octagon.svg" />
    </td>
  </tr>
</table>
