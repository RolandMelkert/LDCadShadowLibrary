# The LDCad Shadow Library

The LDCad Shadow Library is a collection of LDraw 'patch' files whom add snapping and mirroring information to a large subset of official LDraw library parts.

The main goal is to provide LDCad with information it needs to offer auto part snapping during model editing.

The patch approach is needed because the LDraw format currently doesn't provide needed information for accurate part snapping and mirroring (while keeping valid model level matrices).

This missing information is added to the official LDraw library (https://www.ldraw.org) by appending identically named files containing meta lines during the loading process of LDCad.

The ultimate goal of this project is to supply snapping and mirroring information for each and every official LDraw part. But there are almost 10000 official LDraw parts and only one LDCad developer.

For this reason the content was moved to a public git repository in the hopes of finding people willing to help extend the number of supported parts quicker.

You’ll find the latest version of this library at:
https://github.com/RolandMelkert/LDCadShadowLibrary

If you like to contribute please read CONTRIBUTING.md first.

For more information about the LDCad meta lines used in this library please visit: https://www.melkert.net/LDCad/tech/meta

## License

The library is released under the Creative Commons Attribution-ShareAlike 4.0 license (see LICENSE.md)
