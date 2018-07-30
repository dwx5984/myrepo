package cn.sise.ssm.po;

import java.util.ArrayList;
import java.util.List;

public class CategoryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CategoryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCtgyIdIsNull() {
            addCriterion("ctgy_id is null");
            return (Criteria) this;
        }

        public Criteria andCtgyIdIsNotNull() {
            addCriterion("ctgy_id is not null");
            return (Criteria) this;
        }

        public Criteria andCtgyIdEqualTo(Integer value) {
            addCriterion("ctgy_id =", value, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdNotEqualTo(Integer value) {
            addCriterion("ctgy_id <>", value, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdGreaterThan(Integer value) {
            addCriterion("ctgy_id >", value, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ctgy_id >=", value, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdLessThan(Integer value) {
            addCriterion("ctgy_id <", value, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdLessThanOrEqualTo(Integer value) {
            addCriterion("ctgy_id <=", value, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdIn(List<Integer> values) {
            addCriterion("ctgy_id in", values, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdNotIn(List<Integer> values) {
            addCriterion("ctgy_id not in", values, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdBetween(Integer value1, Integer value2) {
            addCriterion("ctgy_id between", value1, value2, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ctgy_id not between", value1, value2, "ctgyId");
            return (Criteria) this;
        }

        public Criteria andCtgyNameIsNull() {
            addCriterion("ctgy_name is null");
            return (Criteria) this;
        }

        public Criteria andCtgyNameIsNotNull() {
            addCriterion("ctgy_name is not null");
            return (Criteria) this;
        }

        public Criteria andCtgyNameEqualTo(String value) {
            addCriterion("ctgy_name =", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameNotEqualTo(String value) {
            addCriterion("ctgy_name <>", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameGreaterThan(String value) {
            addCriterion("ctgy_name >", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameGreaterThanOrEqualTo(String value) {
            addCriterion("ctgy_name >=", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameLessThan(String value) {
            addCriterion("ctgy_name <", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameLessThanOrEqualTo(String value) {
            addCriterion("ctgy_name <=", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameLike(String value) {
            addCriterion("ctgy_name like", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameNotLike(String value) {
            addCriterion("ctgy_name not like", value, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameIn(List<String> values) {
            addCriterion("ctgy_name in", values, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameNotIn(List<String> values) {
            addCriterion("ctgy_name not in", values, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameBetween(String value1, String value2) {
            addCriterion("ctgy_name between", value1, value2, "ctgyName");
            return (Criteria) this;
        }

        public Criteria andCtgyNameNotBetween(String value1, String value2) {
            addCriterion("ctgy_name not between", value1, value2, "ctgyName");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}