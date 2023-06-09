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
    public partial class fpdb2Context
    {
        private Ifpdb2ContextProcedures _procedures;

        public virtual Ifpdb2ContextProcedures Procedures
        {
            get
            {
                if (_procedures is null) _procedures = new fpdb2ContextProcedures(this);
                return _procedures;
            }
            set
            {
                _procedures = value;
            }
        }

        public Ifpdb2ContextProcedures GetProcedures()
        {
            return Procedures;
        }

        protected void OnModelCreatingGeneratedProcedures(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<checkPatientResult>().HasNoKey().ToView(null);
        }
    }

    public partial class fpdb2ContextProcedures : Ifpdb2ContextProcedures
    {
        private readonly fpdb2Context _context;

        public fpdb2ContextProcedures(fpdb2Context context)
        {
            _context = context;
        }

        public virtual async Task<List<checkPatientResult>> checkPatientAsync(DateTime? out_date, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default)
        {
            var parameterreturnValue = new SqlParameter
            {
                ParameterName = "returnValue",
                Direction = System.Data.ParameterDirection.Output,
                SqlDbType = System.Data.SqlDbType.Int,
            };

            var sqlParameters = new []
            {
                new SqlParameter
                {
                    ParameterName = "out_date",
                    Value = out_date ?? Convert.DBNull,
                    SqlDbType = System.Data.SqlDbType.Date,
                },
                parameterreturnValue,
            };
            var _ = await _context.SqlQueryAsync<checkPatientResult>("EXEC @returnValue = [dbo].[checkPatient] @out_date", sqlParameters, cancellationToken);

            returnValue?.SetValue(parameterreturnValue.Value);

            return _;
        }
    }
}
