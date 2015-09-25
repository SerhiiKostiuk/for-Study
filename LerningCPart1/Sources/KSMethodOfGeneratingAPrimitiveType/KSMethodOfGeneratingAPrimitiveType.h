//
//  KSMethodOfGeneratingAPrimitiveType.h
//  LerningCPart1
//
//  Created by Serg Bla on 23.09.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#ifndef KSMethodOfGeneratingAPrimitiveType_h
#define KSMethodOfGeneratingAPrimitiveType_h

#define KSMacrosThatGeneratingValueOfPrimitiveType(type)int output_##type (type)

#define KSCauseDataValueForPrinting(type,value) output_##type (value)

#define KSDataValueForPrinting(type, formatSpecifer)int output_##type (type value)\
        {printf ("A given value "#formatSpecifer" has type "#type"\n",value);return 0;}

#endif /* KSMethodOfGeneratingAPrimitiveType_h */
