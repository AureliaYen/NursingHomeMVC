using Microsoft.AspNetCore.Mvc;
using NursingHouse_v3.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace NursingHouse_v3.Models
{
    [ModelMetadataType(typeof(TEmployeeMetadata))]
    public partial class TEmployee
    {
    }

    [ModelMetadataType(typeof(TBedMetadata))]
    public partial class TBed
    {
    }

    [ModelMetadataType(typeof(TRoombedMetadata))]
    public partial class TRoombed
    {
    }

    [ModelMetadataType(typeof(EnrollmentMetadata))]
    public partial class Enrollment
    {
    }

    [ModelMetadataType(typeof(TNursingRecordMetadata))]
    public partial class TNursingRecord
    {
    }

    [ModelMetadataType(typeof(TOffServiceMetadata))]
    public partial class TOffService
    {
    }

    [ModelMetadataType(typeof(TPatientInfoMetadata))]
    public partial class TPatientInfo
    {
    }
	[ModelMetadataType(typeof(TOrderMetadata))]
	public partial class TOrder
	{
	}

	[ModelMetadataType(typeof(TProductMetadata))]
	public partial class TProduct
	{
	}

	[ModelMetadataType(typeof(TTakeMetadata))]
	public partial class TTake
	{
	}

	[ModelMetadataType(typeof(TMemberMetadata))]
	public partial class TMember
	{
	}
}