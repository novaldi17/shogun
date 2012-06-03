/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2012 Chiyuan Zhang
 * Copyright (C) 2012 Chiyuan Zhang
 */

#ifndef RANDOMCONDITIONALPROBABILITYTREE_H__
#define RANDOMCONDITIONALPROBABILITYTREE_H__

#include <shogun/multiclass/tree/ConditionalProbabilityTree.h>

namespace shogun
{

class CRandomConditionalProbabilityTree: public CConditionalProbabilityTree
{
public:
    /** constructor */
	CRandomConditionalProbabilityTree() {}

    /** destructor */
	virtual ~CRandomConditionalProbabilityTree() {}

    /** get name */
    virtual const char* get_name() const { return "RandomConditionalProbabilityTree"; }

protected:
	/** train machine
	 *
	 * @param data training data 
	 *
	 * @return whether training was successful
	 */
	virtual bool train_machine(CFeatures* data);

private:
	/** to prevent compile error of class_list.cpp */
	virtual void __placeholder__()=0;
};

} /* shogun */ 

#endif /* end of include guard: RANDOMCONDITIONALPROBABILITYTREE_H__ */

