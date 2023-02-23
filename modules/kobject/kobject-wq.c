// SPDX-License-Identifier: GPL-2.0
/*
 * Sample kobject implementation
 *
 * Copyright (C) 2004-2007 Greg Kroah-Hartman <greg@kroah.com>
 * Copyright (C) 2007 Novell Inc.
 */
#include <linux/kobject.h>
#include <linux/string.h>
#include <linux/sysfs.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/workqueue.h>

/*
 * This module shows how to create a simple subdirectory in sysfs called
 * /sys/kernel/kobject-wq  In that directory, 3 files are created:
 * "wq", "pool", and "cpu_pool".  If an integer is written to these files, it can be
 * later read out of it.
 */

static int wq;
static int pwq;
static int pool;
static int cpu_pool;

/*
 * The "wq" file where a static variable is read from and written to.
 */
static ssize_t wq_show(struct kobject *kobj, struct kobj_attribute *attr,
			char *buf)
{
	int var;

	if (strcmp(attr->attr.name, "wq") == 0) {
		var = wq;
                show_wq_pool_simple();
	} else {
		var = pwq;
                show_all_wq_pwq_info();
        }

	return sysfs_emit(buf, "%d\n", var);
}

static ssize_t wq_store(struct kobject *kobj, struct kobj_attribute *attr,
			 const char *buf, size_t count)
{
	int var, ret;

	ret = kstrtoint(buf, 10, &var);
	if (ret < 0)
		return ret;

	if (strcmp(attr->attr.name, "wq") == 0)
		wq = var;
	else
		pwq = var;

	return count;
}

/* Sysfs attributes cannot be world-writable. */
static struct kobj_attribute wq_attribute =
	__ATTR(wq, 0664, wq_show, wq_store);
static struct kobj_attribute pwq_attribute =
	__ATTR(pwq, 0664, wq_show, wq_store);

/*
 * More complex function where we determine which variable is being accessed by
 * looking at the attribute for the "pool" and "cpu_pool" files.
 */
static ssize_t pool_show(struct kobject *kobj, struct kobj_attribute *attr,
		      char *buf)
{
	int var;

	if (strcmp(attr->attr.name, "pool") == 0) {
		var = pool;
                show_pool_info();
	} else {
		var = cpu_pool;
                show_cpu_pool_info();
        }

	return sysfs_emit(buf, "%d\n", var);
}

static ssize_t pool_store(struct kobject *kobj, struct kobj_attribute *attr,
		       const char *buf, size_t count)
{
	int var, ret;

	ret = kstrtoint(buf, 10, &var);
	if (ret < 0)
		return ret;

	if (strcmp(attr->attr.name, "pool") == 0)
		pool = var;
	else
		cpu_pool = var;

	return count;
}

static struct kobj_attribute pool_attribute =
	__ATTR(pool, 0664, pool_show, pool_store);
static struct kobj_attribute cpu_pool_attribute =
	__ATTR(cpu_pool, 0664, pool_show, pool_store);


/*
 * Create a group of attributes so that we can create and destroy them all
 * at once.
 */
static struct attribute *attrs[] = {
	&wq_attribute.attr,
	&pwq_attribute.attr,
	&pool_attribute.attr,
	&cpu_pool_attribute.attr,
	NULL,	/* need to NULL terminate the list of attributes */
};

/*
 * An unnamed attribute group will put all of the attributes directly in
 * the kobject directory.  If we specify a name, a subdirectory will be
 * created for the attributes with the directory being the name of the
 * attribute group.
 */
static struct attribute_group attr_group = {
	.attrs = attrs,
};

static struct kobject *wq_kobj;

static int __init example_init(void)
{
	int retval;

	/*
	 * Create a simple kobject with the name of "kobject_wq",
	 * located under /sys/kernel/
	 *
	 * As this is a simple directory, no uevent will be sent to
	 * userspace.  That is why this function should not be used for
	 * any type of dynamic kobjects, where the name and number are
	 * not known ahead of time.
	 */
	wq_kobj = kobject_create_and_add("kobject_wq", kernel_kobj);
	if (!wq_kobj)
		return -ENOMEM;

	/* Create the files associated with this kobject */
	retval = sysfs_create_group(wq_kobj, &attr_group);
	if (retval)
		kobject_put(wq_kobj);

	return retval;
}

static void __exit example_exit(void)
{
	kobject_put(wq_kobj);
}

module_init(example_init);
module_exit(example_exit);
MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("JaeJoon Jung <rgbi3307@gmail.com>");
