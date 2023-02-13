﻿namespace SLM.Data.Models
{
    public class Courses : BaseEntity
    {
        public Courses()
        {
            Course = new HashSet<Courses>();
        }
        public string Name { get; set; } = string.Empty;

        public string Duration { get; set; } = string.Empty;

        public string Teacher { get; set; } = string.Empty;

        public string Description { get; set; } = string.Empty;

        public ICollection<Courses> Course { get; set; }

    }
}