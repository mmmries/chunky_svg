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
      <svg viewBox="0 0 100 100" height="50" width="50">
        <polygon points="5.00000000000000000000e+01 9.00000000000000000000e+01 8.46410161513775420872e+01 7.00000000000000000000e+01 8.46410161513775562980e+01 3.00000000000000071054e+01 5.00000000000000071054e+01 1.00000000000000000000e+01 1.53589838486224650183e+01 2.99999999999999822364e+01 1.53589838486224365965e+01 6.99999999999999715783e+01"/>
      </svg>
    </td>
  </tr>
</table>
