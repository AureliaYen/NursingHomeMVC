﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using NursingHouseService.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading;
using System.Threading.Tasks;

namespace NursingHouseService.Models
{
    public partial interface Ifpdb2ContextProcedures
    {
        Task<List<checkPatientResult>> checkPatientAsync(DateTime? out_date, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
    }
}