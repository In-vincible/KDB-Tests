// writer.q - Script for KDB+ writer with profiling

// Parse arguments for number of writes per second and concurrency
nWritesPerSec: .z.x 0;
concurrency: .z.x 1;

// Start profiling
.profile.start[];

// Writer logic
// Adjust according to your table and data structure
for each i in til nWritesPerSec * concurrency
{
    insert[`mytable; (rand 100, rand 1.0)];
    // Rate limiting logic here
};

// End profiling
.profile.end[];
