﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.ComponentModel;
using System.Data.EntityClient;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Runtime.Serialization;
using System.Xml.Serialization;

[assembly: EdmSchemaAttribute()]
namespace Planejae.DAL.Classes
{
    #region Contexts
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    public partial class UsuarioDALContainer : ObjectContext
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new UsuarioDALContainer object using the connection string found in the 'UsuarioDALContainer' section of the application configuration file.
        /// </summary>
        public UsuarioDALContainer() : base("name=UsuarioDALContainer", "UsuarioDALContainer")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new UsuarioDALContainer object.
        /// </summary>
        public UsuarioDALContainer(string connectionString) : base(connectionString, "UsuarioDALContainer")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new UsuarioDALContainer object.
        /// </summary>
        public UsuarioDALContainer(EntityConnection connection) : base(connection, "UsuarioDALContainer")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region Partial Methods
    
        partial void OnContextCreated();
    
        #endregion
    
    }

    #endregion

}
