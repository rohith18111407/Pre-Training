using System;

// AttributeUsage(AttributeTargets.Method) ensures this attribute can only be applied to methods.
[AttributeUsage(AttributeTargets.Method)]
public class RunnableAttribute : Attribute
{
}

// RunnableAttribut - A custom attribute used to mark methods that should be run.