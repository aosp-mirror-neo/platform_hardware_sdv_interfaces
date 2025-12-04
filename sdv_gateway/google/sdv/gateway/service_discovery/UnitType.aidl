// Copyright 2024 Google LLC

package google.sdv.gateway.service_discovery;

/**
 * Named identifier for a specific Unit Type.
 *
 * Example of a Unit Type: sdv.package.ServiceBundle#UnitType
 * where:
 * 1. sdv.package is a Package Name;
 * 2. ServiceBundle - is a Bundle Name;
 * 3. UnitType - is a Type Name.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true, Eq=true)
@VintfStability
parcelable UnitType {
    /** The SDV Package that this Unit Type is defined in. */
    @utf8InCpp String sdvPackageName;

    /** The Service Bundle (within the SDV Package) that this Unit Type is defined in. */
    @utf8InCpp String serviceBundleName;

    /** A unique identifier for this Unit Type (within the Service Bundle). */
    @utf8InCpp String typeName;
}
