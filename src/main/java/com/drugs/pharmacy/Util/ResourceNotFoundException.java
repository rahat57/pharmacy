package com.drugs.pharmacy.Util;

import org.springframework.core.io.DescriptiveResource;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public ResourceNotFoundException(String message, DescriptiveResource descriptiveResource) {
        message = message + descriptiveResource.getDescription();
        new ResourceNotFoundException(message);
    }

    public ResourceNotFoundException(String message) {
        super(message);
    }
}