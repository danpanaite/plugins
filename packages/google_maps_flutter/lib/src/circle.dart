// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of google_maps_flutter;

/// An icon placed at a particular geographical location on the map's surface.
/// A circle icon is drawn oriented against the device's screen rather than the
/// map's surface; that is, it will not necessarily change orientation due to
/// map rotations, tilting, or zooming.
///
/// Markers are owned by a single [GoogleMapController] which fires events
/// as markers are added, updated, tapped, and removed.
class Circle {
  @visibleForTesting
  Circle(this._id, this._options);

  /// A unique identifier for this circle.
  ///
  /// The identirifer is an arbitrary unique string.
  final String _id;
  String get id => _id;

  CircleOptions _options;

  /// The circle configuration options most recently applied programmatically
  /// via the map controller.
  ///
  /// The returned value does not reflect any changes made to the circle through
  /// touch events. Add listeners to the owning map controller to track those.
  CircleOptions get options => _options;
}

/// Configuration options for [Circle] instances.
///
/// When used to change configuration, null values will be interpreted as
/// "do not change this configuration option".
class CircleOptions {
  /// Creates a set of circle configuration options.
  ///
  /// By default, every non-specified field is null, meaning no desire to change
  /// circle defaults or current configuration.
  const CircleOptions({
    this.center,
    this.fillColor,
    this.radius,
    this.strokeColor,
    this.strokeWidth,
    this.visible,
  }) : assert(radius == null || radius >= 0);

  /// The position of the circle using a LatLng
  final LatLng center;

  /// The color inside the circle (integer format)
  final int fillColor;

  /// Radius of the circle in meters
  final double radius;

  /// The color of the circle's outline (integer format)
  final int strokeColor;

  /// The width of the circle's outline
  final double strokeWidth;

  /// True if the circle is visible.
  final bool visible;

  /// Default circle options.
  ///
  /// Specifies a circle that
  /// * has its center positioned at 0, 0; [center] is `LatLng(0.0, 0.0)`
  /// * has a transparent fill color; [fillColor] is 0x00000000
  /// * has a radius of 0.0; [radius] is 0.0
  /// * has a black stroke color; [strokeColor] is 0xff000000
  /// * has a stroke width of 10 pixels [draggable] is 10.0
  /// * is visible; [visible] is true
  static const CircleOptions defaultOptions = CircleOptions(
    center: LatLng(0.0, 0.0),
    fillColor: 0x00000000,
    radius: 0.0,
    strokeColor: 0xff000000,
    strokeWidth: 10.0,
    visible: true,
  );

  /// Creates a new options object whose values are the same as this instance,
  /// unless overwritten by the specified [changes].
  ///
  /// Returns this instance, if [changes] is null.
  CircleOptions copyWith(CircleOptions changes) {
    if (changes == null) {
      return this;
    }
    return CircleOptions(
        center: changes.center ?? center,
        fillColor: changes.fillColor ?? fillColor,
        radius: changes.radius ?? radius,
        strokeColor: changes.strokeColor ?? strokeColor,
        strokeWidth: changes.strokeWidth ?? strokeWidth,
        visible: changes.visible ?? visible,
    );
  }

  dynamic _toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    void addIfPresent(String fieldName, dynamic value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('center', center?._toJson());
    addIfPresent('fillColor', fillColor);
    addIfPresent('radius', radius);
    addIfPresent('strokeColor', strokeColor);
    addIfPresent('strokeWidth', strokeWidth);
    addIfPresent('visible', visible);
    
    return json;
  }
}
