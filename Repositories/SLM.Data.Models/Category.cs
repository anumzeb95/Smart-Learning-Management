﻿
namespace SLM.Data.Models
{
    public class Category : BaseEntity
    {
       
        public string Name { get; set; } = string.Empty;

        public string Courses { get; set; } = string.Empty;

        public string Duration { get; set; } = string.Empty;

        public string Description { get; set; } = string.Empty;

        
    }
}